-- OPCG battle module — 네이티브 배틀 타임라인 위의 스텝 복원 (2026-07-13).
--
-- 어택 선언(idle t=9 → Processors::BattleCommand), 데미지 판정
-- (calculate_battle_damage + rules 판정 심), KO 파괴와 치환
-- (EFFECT_DESTROY_REPLACE)은 전부 네이티브 배틀 머신이 주관한다. 이 모듈은
-- 스톡 배틀이 모르는 OPCG 고유 스텝만 스톡 이벤트의 제자리에 삽입한다 —
-- 구 lua 일괄 배틀(모놀리스)도, NegateAttack 우회도 없다.
--
--   EVENT_ATTACK_ANNOUNCE      선언 정리: 공격자 레스트, 어택 코스트(손패
--                              버리기) 지불, 배틀 상태 초기화,
--                              WHEN_ATTACKING_OPPONENT_LEADER 디스패치
--   EVENT_BATTLE_START         블록 스텝: 후보 산출 → 선택 → 블로커 레스트 →
--                              Duel.ChangeAttackTarget(스톡 타겟 교체) →
--                              ON_BLOCK 계열 → WHEN_BATTLING 계열
--   EVENT_PRE_DAMAGE_CALCULATE 카운터 스텝: 캐릭터 카운터(수치)와 이벤트
--                              카운터([카운터] 타이밍)를 사양할 때까지 반복
--   EVENT_BATTLED              리더 피격 판정(동률 이상 히트, 더블어택=2,
--                              바니시) + ON_DAMAGE_TO_OPPONENT_LIFE
--   EVENT_DAMAGE_STEP_END      KO 계열 디스패치, AFTER_BATTLE/END_OF_BATTLE,
--                              카운터 버프 청산, 직결 트리거 배수,
--                              END_OF_BATTLE 경계
--   EVENT_TO_GRAVE             둥 구조 불변식(트래시에 떨어진 둥 즉시 귀환)
--
-- 재발신 금지(이중발동 방지): WHEN_ATTACKING / ON_OPPONENT_ATTACK / ON_KO 는
-- opcg_core.BindCard 가 네이티브 이벤트(EVENT_ATTACK_ANNOUNCE /
-- EVENT_DESTROYED)에 직접 바인딩하므로 여기서 이름으로 부르지 않는다.
-- 구 일괄 배틀 원본: script_backups/opcg_battle.pre-native-battle-20260712.lua

opcg = opcg or {}
opcg.battle = opcg.battle or {}
local B = opcg.battle

-- 프롬프트 스트링은 둥 코스트 호스트(879999999)의 cdb 텍스트 슬롯
-- (aux.Stringid = code<<20|n → texts.strN+1) — !system id 충돌 없음.
B.BLOCK_PROMPT = B.BLOCK_PROMPT or aux.Stringid(879999999, 0)
B.COUNTER_PROMPT = B.COUNTER_PROMPT or aux.Stringid(879999999, 1)
B.BLOCK_SELECT_HINT = B.BLOCK_SELECT_HINT or aux.Stringid(879999999, 2)
B.COUNTER_SELECT_HINT = B.COUNTER_SELECT_HINT or aux.Stringid(879999999, 3)

-- 진행 중인 배틀 하나의 상태. announce가 새로 만들고 damage step end가
-- 지운다. (선언~데미지 스텝 사이에 어택이 네이티브 취소되면 다음 announce의
-- 리셋이 청소를 겸한다 — THIS_BATTLE 지속은 네이티브 리셋이 이중 안전망.)
B._live = nil

local function array(group)
	local result = {}
	if not group then return result end
	if group.GetFirst then
		local card = group:GetFirst()
		while card do
			result[#result + 1] = card
			card = group:GetNext()
		end
		return result
	end
	for _, card in ipairs(group) do result[#result + 1] = card end
	return result
end

local function to_group(cards)
	local group = Group.CreateGroup()
	for _, card in ipairs(cards) do group:AddCard(card) end
	return group
end

local function field_cards(player)
	local group = Duel.GetMatchingGroup(function(card)
		return opcg.IsLeader(card) or opcg.IsCharacter(card) or opcg.IsStage(card)
	end, player, LOCATION_MZONE + LOCATION_FZONE, 0, nil)
	local cards = array(group)
	table.sort(cards, function(left, right)
		local ll, rl = left:GetLocation(), right:GetLocation()
		if ll ~= rl then return ll < rl end
		return left:GetSequence() < right:GetSequence()
	end)
	return cards
end

local function dispatch(cards, timing, context)
	if opcg.effect_queue and opcg.effect_queue.resolve_timing then
		return opcg.effect_queue.resolve_timing(cards, timing, context or {}, {})
	end
end

local function has_matching_effect(card, code, target, context)
	return opcg.HasMatchingEffect and opcg.HasMatchingEffect(card, code, target, context)
end

-- 어택 코스트(REQUIRE_ATTACK_DISCARD: "어택하려면 손패 N장을 버린다").
-- 선언 가능성 쪽은 rules의 선언 제약 심이 이 함수를 되물어 봉쇄한다.
function B.required_attack_discard(attacker, player, context)
	if not opcg.EFFECT_REQUIRE_ATTACK_DISCARD then return 0 end
	local required = 0
	for _, effect in ipairs({Duel.IsPlayerAffectedByEffect(player, opcg.EFFECT_REQUIRE_ATTACK_DISCARD)}) do
		local value = opcg.GetEffectValue(effect)
		if type(value) == "table" then
			local predicate = opcg.CompileFilter(value.attacker_filter or {}, context or {})
			if predicate and predicate(attacker) then required = math.max(required, value.count or 1) end
		elseif type(value) == "function" then
			local applies, count = value(effect, attacker, context or {})
			if applies then required = math.max(required, count or 1) end
		elseif value then
			required = math.max(required, 1)
		end
	end
	return required
end

local function pay_attack_discard(attacker, player, context)
	local count = B.required_attack_discard(attacker, player, context)
	if count <= 0 then return true end
	local hand = Duel.GetFieldGroup(player, LOCATION_HAND, 0)
	if hand:GetCount() < count then return false end
	local selected = hand:Select(player, count, count, nil)
	return Duel.SendtoGrave(selected, REASON_COST + REASON_DISCARD) == count
end

local function begin_battle(attacker, target)
	-- 치환 생존 도장(contract_ops register_native_replace가 찍음)은 배틀
	-- 단위 — 새 배틀마다 백지로
	opcg._replace_saved = setmetatable({}, {__mode="k"})
	local attacking_player = attacker:GetControler()
	local live = {
		attacker = attacker,
		original_target = target,
		attacking_player = attacking_player,
		defending_player = 1 - attacking_player,
		counter_prompted = false,
		counter_power = 0,
		counter_effects = {},
		blocker = nil,
	}
	live.context = {
		battle = live,
		battle_attacker = attacker,
		battle_target = target,
		player = attacking_player,
	}
	B._live = live
	return live
end

-- 훅마다 상태를 재확인: announce를 못 본 배틀(이론상 없음)도 죽지 않는다.
local function live_for(attacker)
	local live = B._live
	if live and live.attacker == attacker then return live end
	return begin_battle(attacker, Duel.GetAttackTarget())
end

local function blocker_candidates(live)
	if opcg.HasKeyword(live.attacker, "UNBLOCKABLE") then return {} end
	local result = {}
	for _, card in ipairs(field_cards(live.defending_player)) do
		if card ~= live.original_target
			and (opcg.IsCharacter(card) or opcg.IsLeader(card))
			and opcg.IsActive(card)
			-- 블로커 발동 = 그 카드를 레스트로 하는 행위(총합룰 6-3-2) -
			-- "레스트로 할 수 없다" 상태면 블록도 선언 불가
			and opcg.CanBeRested(card, "BLOCK")
			and opcg.HasKeyword(card, "BLOCKER")
			and not has_matching_effect(live.attacker,
				opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION, card, live.context)
			and not has_matching_effect(card,
				opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION, live.attacker, live.context) then
			result[#result + 1] = card
		end
	end
	return result
end

-- YES는 확약이 아니다: 픽이 0~1장이라 아무것도 안 집으면 프롬프트로
-- 되돌아오고, 잘못 누른 YES는 언제든 물릴 수 있다.
local function select_blocker(player, candidates)
	if #candidates == 0 then return nil end
	while true do
		if not Duel.SelectYesNo(player, B.BLOCK_PROMPT) then return nil end
		Duel.Hint(HINT_SELECTMSG, player, B.BLOCK_SELECT_HINT)
		local picked = to_group(candidates):Select(player, 0, 1, nil):GetFirst()
		if picked then return picked end
	end
end

-- ───── 카운터 프리뷰 기대치 (유저 API 재정 2026-08-06) ─────
-- "확정하면 실제로 올라갈 타점"을 아는 쪽(Lua/IR)이 계산해 클라에 민다.
-- 전선 = MSG_HINT 커스텀 타입 214, 수비측 한정 발송(손패 유래 숫자라
-- 브로드캐스트 금지). 구exe는 힌트 스위치에서 조용히 무시하고 구호스트는
-- 미지 타입을 아예 중계하지 않으므로(각각 duelclient/generic_duel 실측)
-- 신구 혼재에서 우아하게 강등된다 — 마젠타는 def합 폴백으로 동작.
B.HINT_COUNTER_EXPECT = 214
-- [2026-08-15 유저 제안] 카운터 처리 종료 스플래시: 확정된 총 상승분을 양측에
-- 잠깐(클라 rev38가 ~1초) 표시한다. 확정 시점엔 카운터가 공개된 정보라 214와
-- 달리 브로드캐스트가 안전하다. 구exe는 미지 힌트라 조용히 무시.
B.HINT_COUNTER_FINAL = 218

function Duel.SetCounterPreviewExpectation(player, value)
	if not Duel.Hint then return end
	Duel.Hint(B.HINT_COUNTER_EXPECT, player, math.max(0, math.floor(value or 0)))
end

local function emit_counter_final(live)
	if not Duel.Hint then return end
	local total = math.floor(live and live.counter_power or 0)
	if total > 0 then Duel.Hint(B.HINT_COUNTER_FINAL, live.defending_player, total) end
end
B.emit_counter_final = emit_counter_final

-- 이벤트 한 장의 기대 타점. 평가 규약(과소 방향 보수 — 프리뷰는 모자란
-- 게 거짓말보다 낫고, 실수치는 해결이 맞춘다):
--   · COUNTER 타이밍 효과의 고정 MODIFY_POWER만, 자기편 대상·양수 한정
--     (조준 가정: 방어측 — 고정 +3000짜리들도 대상 선택형이라 이미 현행
--     암묵 전제다). 상대 감산·PER_* 동적 수량은 0 취급.
--   · IF 후속은 조건이 정적으로 판정돼 참일 때만 중첩 고정 가산을 계상
--     (2026-08-08 유저 제보, OP12-098 잔털 처리권: "그 후 … +2000"이 통째로
--     0 취급이라 8코 혁명군이 깔려 있어도 마젠타가 +2000만 보였다).
--     판정 에러·실패·동적 수량은 종전대로 0 — 보수 규약은 그대로다.
--   · effect 조건 = can_resolve(비대화형), action/IF 조건 = 어댑터 직판정
--     (조건별 pcall 격리: 미지원 op가 한 장 전체 기대치를 죽이지 않게).
--   · 표시 전용이므로 pcall 격리 — 평가기가 배틀을 죽이는 일은 없다.
local function event_counter_expectation(card, player, live)
	local ok, total = pcall(function()
		if not (opcg.runtime and opcg.runtime.get_definition) then return 0 end
		local definition = opcg.runtime.get_definition(card)
		if not definition then return 0 end
		local adapter = opcg.runtime.adapter
		local function conditions_pass(conditions, context)
			for _, condition in ipairs(conditions or {}) do
				local okc, res = pcall(function()
					return adapter and adapter:check_condition(condition, context)
				end)
				if not (okc and res) then return false end
			end
			return true
		end
		local function sum_actions(actions, context)
			local sum = 0
			for _, action in ipairs(actions or {}) do
				if action.op == "MODIFY_POWER"
					and type(action.amount) == "number" and action.amount > 0
					and (not action.selector or action.selector.owner ~= "OPPONENT")
					and conditions_pass(action.conditions, context) then
					sum = sum + action.amount
				elseif action.op == "IF" and conditions_pass(action.conditions, context) then
					sum = sum + sum_actions(action.actions, context)
				end
			end
			return sum
		end
		local sum = 0
		for _, effect in ipairs(definition.effects or {}) do
			local timed = false
			for _, timing in ipairs(effect.timings or {}) do
				if timing == "COUNTER" then timed = true break end
			end
			if timed then
				-- 어택 대상은 도중에 바뀔 수 있다(블로커/CHANGE_ATTACK_TARGET) —
				-- 코어의 현재 대상으로 판정(2026-08-18 OP14-060 제보 후속).
				local context = { card = card, player = player, timing = "COUNTER",
					battle = live, battle_attacker = live.attacker,
					battle_target = Duel.GetAttackTarget() or live.original_target }
				if opcg.runtime.can_resolve(card, effect.effect_id, context) then
					sum = sum + sum_actions(effect.actions, context)
				end
			end
		end
		return sum
	end)
	if ok and type(total) == "number" then return total end
	return 0
end

-- picked(클릭 순서 배열)가 지금 확정되면 어택 타겟에 얹힐 총 타점.
local function counter_expectation(picked, live)
	local total = 0
	for _, card in ipairs(picked) do
		local value = opcg.EffectiveCounter(card, live.defending_player)
		if value > 0 then
			total = total + value
		elseif opcg.IsEvent(card) then
			total = total + event_counter_expectation(card, live.defending_player, live)
		end
	end
	return total
end

-- 집힌 이벤트들의 둥 지불 풋프린트(레스트 코스트 합). EB01-038류 특수
-- 지불(둥 반납)은 여기 안 잡히는 잔여 모서리 — 해결부의 장당 재확인이
-- 그대로 받치고, 기대치도 그 시점 재평가로 자기 보고한다.
local function picked_don_footprint(picked, player)
	local total = 0
	for _, card in ipairs(picked) do
		if opcg.EffectiveCounter(card, player) <= 0 and opcg.IsEvent(card) then
			total = total + opcg.GetCost(card)
		end
	end
	return total
end

-- [2026-08-06 개편] 일괄 창 → 셀렉·언셀렉 토글 루프(유저 원안).
--   · 토글마다 둥 예산 재산정: 집힌 이벤트 코스트 합을 넘기는 후보는
--     selectable에서 제외 — "조용한 불발"을 선택 단계에서 원천 봉쇄.
--   · picked = 클릭 순서 보존 배열, 해결 순서가 곧 이 순서(총합룰
--     "한 장씩 사용" 정합 — 조건 이벤트끼리의 교호도 유저가 순서로 다스린다).
--   · 토글마다 기대치 푸시 — 마젠타가 이벤트 몫까지 실시간 진실.
--   0장 확정 = 사양(finishable, 현행 사양 유지). 두 그룹은 서로소 유지
--   (SelectUnselect는 겹치면 nil을 던진다 — libgroup 실측).
local function select_counters(player, candidates, live)
	if #candidates == 0 then
		-- 심리전: 한 어택의 첫 카운터 창은 쓸 게 없어도 프롬프트를 띄운다.
		-- 즉시 스킵되면 어태커가 손패(비공개)를 읽는다 — 블로커는 공개
		-- 정보라 이 배려가 없고, 같은 어택의 두 번째 창부터는 조용히 넘어간다.
		if not live.counter_prompted then
			live.counter_prompted = true
			Duel.SelectYesNo(player, B.COUNTER_PROMPT)
		end
		return {}
	end
	live.counter_prompted = true
	local picked = {}
	local picked_group = Group.CreateGroup()
	while true do
		local budget = opcg.ActiveDon(player) - picked_don_footprint(picked, player)
		local selectable = Group.CreateGroup()
		for _, card in ipairs(candidates) do
			if not picked_group:IsContains(card) then
				local value = opcg.EffectiveCounter(card, player)
				if value > 0 or opcg.GetCost(card) <= budget then
					selectable:AddCard(card)
				end
			end
		end
		-- 양쪽 다 빈 그룹이면 호출 금지(코어 step0가 빈 창을 안 열고 빈
		-- 반환을 뱉는 경계 — libgroup이 list[0]을 집다 넘어진다). 정상
		-- 흐름에선 도달 불가지만 안전핀으로 박아둔다.
		if selectable:GetCount() == 0 and #picked == 0 then break end
		Duel.SetCounterPreviewExpectation(player, counter_expectation(picked, live))
		Duel.Hint(HINT_SELECTMSG, player, B.COUNTER_SELECT_HINT)
		local toggled = selectable:SelectUnselect(picked_group, player, true, false, 0, #candidates)
		if not toggled then break end
		if picked_group:IsContains(toggled) then
			picked_group:RemoveCard(toggled)
			for index, card in ipairs(picked) do
				if card == toggled then
					table.remove(picked, index)
					break
				end
			end
		else
			picked_group:AddCard(toggled)
			picked[#picked + 1] = toggled
		end
	end
	return picked
end

-- 카운터 수치는 현재 어택 타겟에 '이 배틀 동안'의 파워로 얹는다. 표시
-- 파워가 즉시 올라 양쪽 클라(QUERY_ATTACK 상시 갱신)에 보이고, 판정 심
-- (EFFECT_CHANGE_BATTLE_STAT = GetAttack 그대로)도 자동 반영한다.
local function apply_counter_power(live, target, value)
	local buff = Effect.CreateEffect(target)
	buff:SetType(EFFECT_TYPE_SINGLE)
	buff:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
	buff:SetCode(EFFECT_UPDATE_ATTACK)
	buff:SetValue(value)
	buff:SetReset(RESET_EVENT + RESETS_STANDARD)
	target:RegisterEffect(buff)
	live.counter_effects[#live.counter_effects + 1] = { card = target, effect = buff }
end

local function resolve_event_counter(card, live)
	local context = {}
	for key, value in pairs(live.context) do context[key] = value end
	-- [2026-08-18 유저 제보] OP14-060류 【상대의 어택 시】가 어택 대상을 바꾸면
	-- 엔진 트리거 컨텍스트엔 battle 링크가 없어 live.context.battle_target이 원
	-- 대상에 머물렀고, 카운터 이벤트의 자동 조준(+N)이 원 대상에 발렸다.
	-- 코어의 현재 대상이 진실 — 여기서 맞춘다.
	context.battle_target = Duel.GetAttackTarget() or context.battle_target
	live.context.battle_target = context.battle_target
	context.card = card
	context.player = live.defending_player
	context.event_target = card
	context.event_targets = {card}
	context.event_cards = {card}
	context.event_count = 1
	context.event_player = live.defending_player
	context.effect_play = true
	if opcg.contract_ops and opcg.contract_ops.emit then
		if opcg.RecordEventActivated then opcg.RecordEventActivated(live.defending_player, card) end
		opcg.contract_ops.emit("ON_YOUR_EVENT_ACTIVATED", context, live.defending_player)
		opcg.contract_ops.emit("ON_OPPONENT_EVENT_ACTIVATED", context, live.attacking_player)
		opcg.contract_ops.emit("ON_OPPONENT_EVENT_OR_TRIGGER_ACTIVATED", context, live.attacking_player)
		opcg.contract_ops.emit("ON_OPPONENT_BLOCKER_OR_EVENT_ACTIVATED", context, live.attacking_player)
	end
	return opcg.effect_queue.resolve_timing({card}, "COUNTER", context, {
		prevalidated = true,
		before_resolve = function()
			-- 이벤트 카운터의 둥 코스트는 사용 선언 즉시 지불
			opcg.RestDon(live.defending_player, opcg.GetCost(card))
			Duel.SendtoGrave(card, REASON_RULE)
			return true
		end,
	})
end

-- picked의 index 이후 꼬리(아직 해결 안 된 몫).
local function picked_tail(picked, from)
	local tail = {}
	for index = from, #picked do tail[#tail + 1] = picked[index] end
	return tail
end

local function run_counter_step(live)
	while true do
		local target = Duel.GetAttackTarget()
		-- 대상 변경(블로커·CHANGE_ATTACK_TARGET) 반영: 이후 이벤트 컨텍스트/조건이
		-- 현재 대상을 보게 한다.
		if target then live.context.battle_target = target end
		if not target then
			Duel.SetCounterPreviewExpectation(live.defending_player, 0)
			emit_counter_final(live)
			return
		end
		local candidates = {}
		for _, card in ipairs(array(Duel.GetFieldGroup(live.defending_player, LOCATION_HAND, 0))) do
			local counter_value = opcg.EffectiveCounter(card, live.defending_player)
			local event_counter = opcg.IsEvent(card)
				and opcg.CanRestDon(live.defending_player, opcg.GetCost(card))
				and opcg.effect_queue and opcg.effect_queue.has_timing
				and opcg.effect_queue.has_timing(card, "COUNTER", {
					card = card, player = live.defending_player, battle = live,
				})
			if counter_value > 0 or event_counter then
				candidates[#candidates + 1] = card
			end
		end
		local picked = select_counters(live.defending_player, candidates, live)
		if #picked == 0 then
			Duel.SetCounterPreviewExpectation(live.defending_player, 0)
			emit_counter_final(live)
			return
		end
		-- [2026-08-06 개편] 해결 = 클릭 순서 그대로(총합룰 "한 장씩 사용").
		-- 연속 수치 구간만 한 묶음 트래시+합산(교환법칙 등가, 연출 절약).
		-- 단계마다 남은 몫 기대치를 다시 밀어 마젠타가 이중가산 없이 진실을
		-- 유지한다 — 이벤트가 둥·조건을 바꾸면 다음 푸시가 그걸 반영한다.
		local resolved_event = false
		local index = 1
		while index <= #picked do
			target = Duel.GetAttackTarget()
			local card = picked[index]
			if opcg.EffectiveCounter(card, live.defending_player) > 0 then
				local chars = Group.CreateGroup()
				local total = 0
				while index <= #picked do
					local run_card = picked[index]
					local run_value = opcg.EffectiveCounter(run_card, live.defending_player)
					if run_value > 0 then
						chars:AddCard(run_card)
						total = total + run_value
						index = index + 1
					else
						break
					end
				end
				Duel.SendtoGrave(chars, REASON_COST)
				if target then
					apply_counter_power(live, target, total)
					live.counter_power = live.counter_power + total
				end
			else
				-- 앞선 해석이 둥을 소모했을 수 있으니 장마다 지불 재확인
				-- (예산 봉쇄 후 남은 유일한 관문 = 특수 지불 모서리).
				if opcg.IsEvent(card)
					and opcg.CanRestDon(live.defending_player, opcg.GetCost(card)) then
					resolve_event_counter(card, live)
					resolved_event = true
				end
				index = index + 1
			end
			Duel.SetCounterPreviewExpectation(live.defending_player,
				counter_expectation(picked_tail(picked, index), live))
		end
		Duel.SetCounterPreviewExpectation(live.defending_player, 0)
		-- 이벤트가 상태를 바꿨으면 창을 다시 연다(추가 사용 기회);
		-- 수치 카운터만 썼다면 전 후보가 이미 한 창에 나왔으니 종료.
		if not resolved_event then
			emit_counter_final(live)
			return
		end
	end
end

function B.install()
	if B._installed then return end
	B._installed = true

	-- ① 선언 정리 — 공식 룰: 선언 즉시 공격자 레스트(구 심 a 이관).
	-- 어택 코스트(손패 버리기 강제)도 효과 창이 열리기 전 이 자리에서 지불.
	local announce = Effect.GlobalEffect()
	announce:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
	announce:SetCode(EVENT_ATTACK_ANNOUNCE)
	announce:SetOperation(function()
		local attacker = Duel.GetAttacker()
		if not attacker then return end
		-- cause=ATTACK: 전면형 레스트 금지는 애초에 CANNOT_ATTACK 동반이라 여기
		-- 못 오고, OPPONENT_EFFECT형(자기 어택은 정상)은 이 원인 표기로 통과한다
		if not opcg.IsRested(attacker) then opcg.SetRested(attacker, nil, "ATTACK") end
		local live = begin_battle(attacker, Duel.GetAttackTarget())
		pay_attack_discard(attacker, live.attacking_player, live.context)
		local target = Duel.GetAttackTarget()
		if target and opcg.IsLeader(target) then
			-- WHEN_ATTACKING 본체는 BindCard의 네이티브 트리거가 발화한다 —
			-- 리더 한정 변형만 여기서 이름으로 디스패치.
			dispatch({attacker}, "WHEN_ATTACKING_OPPONENT_LEADER", live.context)
		end
		-- 어택시 효과의 정위치 = 여기(블록 스텝 전). direct 큐(콜렉터 배틀
		-- 분기)와 엔진 큐(거절로 표류한 임의 후보) 둘 다 이 창에서 배수해야
		-- 모든 [상대의 어택 시]가 한 타이밍에 통일된다. 엔진 펌프가 없으면
		-- 선행 임의 거절 시 잔여 후보가 블록/데미지 스텝까지 표류한다
		-- (이조 vs 에이스E1 창 분리 실측 - 컴퓨터유즈 채증).
		if opcg.effect_queue then
			if opcg.effect_queue.pump_window then opcg.effect_queue.pump_window() end
			if opcg.effect_queue.drain_direct then
				opcg.effect_queue.drain_direct({}, nil, live.context)
			end
		end
	end)
	Duel.RegisterEffect(announce, 0)

	-- ② 블록 스텝 — 데미지 스텝 개시(어택 시 효과 창이 모두 끝난 자리).
	local block = Effect.GlobalEffect()
	block:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
	block:SetCode(EVENT_BATTLE_START)
	block:SetOperation(function()
		local attacker = Duel.GetAttacker()
		local target = Duel.GetAttackTarget()
		if not attacker or not target then return end
		local live = live_for(attacker)
		-- 어택 시 복합 문면(어택 시/상대의 어택 시 = WHEN_ATTACKING_OR_ATTACKED)도
		-- 블록 선언 전에 완주해야 한다(총합룰 어택 순서; 유저 재정 2026-08-02:
		-- 선언 → 턴P 어택시 → 비턴P 어택시 → 블로커). 종전엔 블로커 선택 뒤에
		-- 발화해 루시(OP15-002)류 펌프가 블록 결정보다 늦게 떴다.
		-- 나열 = attacker(턴P) 먼저, 원 대상(비턴P) 다음.
		dispatch({attacker, target}, "WHEN_ATTACKING_OR_ATTACKED", live.context)
		-- [OP17-040] "자신의 리더가 어택했을 때나 어택당했을 때" — 리더 전투를
		-- 지켜보는 자기편 필드 카드용 관전 타이밍(어택 시 창과 같은 자리).
		if opcg.IsLeader(attacker) then
			dispatch(field_cards(live.attacking_player), "ON_OWN_LEADER_BATTLE", live.context)
		end
		if opcg.IsLeader(target) then
			dispatch(field_cards(live.defending_player), "ON_OWN_LEADER_BATTLE", live.context)
		end
		-- 어택시 창 마감 펌프: 선행 임의효과 거절로 표류 중인 [상대의 어택 시]
		-- 계열 잔여 후보를 블록 프롬프트 전에 완주시킨다(타이밍 통일).
		if opcg.effect_queue and opcg.effect_queue.pump_window then
			opcg.effect_queue.pump_window()
		end
		local blocker = select_blocker(live.defending_player, blocker_candidates(live))
		if blocker then
			live.blocker = blocker
			opcg.SetRested(blocker, nil, "BLOCK")
			-- 스톡 타겟 교체(두 번째 인자 = 후보 재검사 생략: OPCG 적법성은
			-- 위에서 이미 판단). MSG_ATTACK 재발신으로 어택선이 블로커로
			-- 다시 그려지고, 클라 attack_target(마젠타 프리뷰 앵커)도 갱신.
			Duel.ChangeAttackTarget(blocker, true)
			live.context.battle_target = blocker
			dispatch({blocker}, "ON_BLOCK", live.context)
			dispatch(field_cards(live.attacking_player),
				"ON_OPPONENT_BLOCKER_ACTIVATED", live.context)
			dispatch(field_cards(live.attacking_player),
				"ON_OPPONENT_BLOCKER_OR_EVENT_ACTIVATED", live.context)
		end
		-- '배틀 할 때'(WHEN_BATTLING)만 블록 후: 배틀 상대 확정 시점 문면.
		local current = Duel.GetAttackTarget() or target
		dispatch({attacker, current}, "WHEN_BATTLING", live.context)
	end)
	Duel.RegisterEffect(block, 0)

	-- ③ 카운터 스텝 — 데미지 계산 직전 창.
	local counter = Effect.GlobalEffect()
	counter:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
	counter:SetCode(EVENT_PRE_DAMAGE_CALCULATE)
	counter:SetOperation(function()
		local attacker = Duel.GetAttacker()
		local target = Duel.GetAttackTarget()
		if not attacker or not target then return end
		-- 블록 창 잔여 펌프(블록 스텝의 거절 표류분) — 카운터 프롬프트 전 완주.
		if opcg.effect_queue and opcg.effect_queue.pump_window then
			opcg.effect_queue.pump_window()
		end
		local live = live_for(attacker)
		run_counter_step(live)
		-- 데미지·KO 판정 직전의 최종 타겟을 박제(파괴 후 훅들이 참조)
		live.final_target = Duel.GetAttackTarget() or target
		live.final_target_is_character = opcg.IsCharacter(live.final_target)
		-- 【두웅!!×N】 KO시 게이트용 스냅샷: 정상 배틀 KO는 네이티브 파괴라
		-- lua 제거 경로(remove_cards/trash)의 스탬프를 안 탄다 — 8/12 수리가
		-- 효과 KO만 덮고 이 경로를 놓쳐 재발(OP14-051 유저 재제보 2026-08-28).
		-- 카운터 스텝까지 끝난 여기가 부착 수 최종 확정 시점.
		if live.final_target_is_character and opcg.RecordDonAtLeave then
			opcg.RecordDonAtLeave(live.final_target)
		end
	end)
	Duel.RegisterEffect(counter, 0)

	-- ④ 리더 피격 판정 — 데미지 계산 직후(구 심 3c 이관+확장). 동률 이상 =
	-- 히트. 더블어택 = 라이프 2, 바니시 = 라이프 카드 제외. 라이프 감소
	-- 계열 타이밍은 opcg.life.damage_leader가 중앙 디스패치(효과 데미지 공유).
	local battled = Effect.GlobalEffect()
	battled:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
	battled:SetCode(EVENT_BATTLED)
	battled:SetOperation(function()
		local attacker = Duel.GetAttacker()
		local target = Duel.GetAttackTarget()
		if not attacker or not target or not opcg.IsLeader(target) then return end
		if not (opcg.IsLeader(attacker) or opcg.IsCharacter(attacker)) then return end
		if attacker:GetAttack() < target:GetAttack() then return end
		local live = live_for(attacker)
		local amount = opcg.HasKeyword(attacker, "DOUBLE_ATTACK") and 2 or 1
		local damage = opcg.life.damage_leader(live.defending_player, amount, {
			attacking_player = live.attacking_player,
			attacker = attacker,
			banish = opcg.HasKeyword(attacker, "BANISH"),
			battle = live,
		})
		live.damage = damage
		if damage and damage.processed and damage.processed > 0 then
			live.context.damage = damage.processed
			dispatch(field_cards(live.attacking_player),
				"ON_DAMAGE_TO_OPPONENT_LIFE", live.context)
		end
	end)
	Duel.RegisterEffect(battled, 0)

	-- ⑤ 배틀 종료 — KO 계열 디스패치, AFTER_BATTLE/END_OF_BATTLE, 카운터
	-- 버프 청산, 직결 트리거 배수(구 심 3d 이관), END_OF_BATTLE 경계.
	local finish = Effect.GlobalEffect()
	finish:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
	finish:SetCode(EVENT_DAMAGE_STEP_END)
	finish:SetOperation(function()
		local live = B._live
		if not live then return end
		local attacker = live.attacker
		local target = live.final_target or Duel.GetAttackTarget()
		local context = live.context
		-- [구 ko= 1:1 이식] 네이티브 파괴 집행은 배틀 개시 때 박제한 '원래
		-- 타겟'(pre_field)과 대조하므로, 블록으로 교체된 타겟은 파워에서
		-- 져도 파괴 후보에서 영영 빠진다. 네이티브가 못 죽인 몫을 옛 배틀의
		-- ko= 그대로 여기서 집행: 둥 반환 → REASON_BATTLE 파괴(치환기 경유)
		-- → 수동 EVENT_DESTROYED (스톡 send_to는 전투 파괴엔 이벤트를 안
		-- 올린다 — operations.cpp 비전투 한정 raise). 카운터 버프 청산 전이라
		-- 판정 파워도 정확하다. 정상 KO된 타겟은 이미 묘지라 자연 통과.
		-- 단, 교체된 배틀 한정(원래 타겟과 다를 때만): 원래 타겟이 아직
		-- MZONE인 건 "네이티브가 놓친" 게 아니라 치환(REPLACE_KO)이 파괴를
		-- 취소한 결과다 — 여기서 또 죽이면 코스트만 떼먹는 이중 집행이 된다
		-- (EB03-001 유저 제보 2026-07-27: 패 1장 버리고도 배틀 KO됨).
		if target and live.final_target_is_character
			and target ~= live.original_target
			and not (opcg._replace_saved and opcg._replace_saved[target])
			and target:IsLocation(LOCATION_MZONE)
			and attacker and attacker:GetAttack() >= target:GetAttack() then
			-- [2026-08-10 유저 재정] 선제 둥 반환 폐지 — 내성으로 파괴가 불발되면
			-- 둥이 그대로 남아야 한다. 실제 KO분은 EVENT_TO_GRAVE 워처가 귀환 처리.
			if opcg.RecordDonAtLeave then opcg.RecordDonAtLeave(target) end -- 【두웅!!×N】 KO시 게이트용 스냅샷
			-- [2026-08-10 룰 재정] 무효 상태로 KO → 【KO 시】 봉인 스탬프
			if opcg.StampNegatedKO then opcg.StampNegatedKO(target) end
			local moved = Duel.Destroy(target, REASON_BATTLE)
			if moved > 0 then
				Duel.RaiseSingleEvent(target, EVENT_DESTROYED, nil,
					REASON_BATTLE + REASON_DESTROY, live.attacking_player,
					live.attacking_player, 0)
			end
		end
		-- ON_KO 본체는 네이티브 EVENT_DESTROYED 바인딩이 발화 — 여기서는
		-- 관점형 KO 타이밍(자/타/전장)만 이름으로 디스패치한다.
		if target and live.final_target_is_character
			and target:IsLocation(LOCATION_GRAVE) and target:IsReason(REASON_BATTLE) then
			dispatch({attacker}, "ON_BATTLE_KO", context)
			-- [2026-08-10 룰 재정] 무효된 채 KO된 캐릭터는 자기 KO 타이밍도 봉인
			if target:GetFlagEffect(opcg.FLAG_NEGATED_KO) == 0 then
				dispatch({target}, "ON_SELF_KO", context)
			end
			-- KO 계열 공통 정제 문맥: event_target에 KO된 캐릭터를 박은 사본.
			-- live.context를 그대로 주면 ①리더 히트가 남긴 damage가 '데미지
			-- 받음' 분기를 오발시키고 ②EVENT_TARGET_* 조건(행콕 OP14-041 등)이
			-- 판정할 대상이 없어 소리 없이 탈락한다(유저 리플레이 제보
			-- 2026-07-29: 둥×1 부여 상태에서 아군 KO에도 E2 무프롬프트).
			local ko_event = {}
			for key, value in pairs(context or {}) do ko_event[key] = value end
			ko_event.damage = nil
			ko_event.event_damage = nil
			ko_event.event_target = target
			ko_event.event_targets = {target}
			ko_event.event_cards = {target}
			ko_event.event_count = 1
			dispatch(field_cards(live.attacking_player),
				"ON_OPPONENT_CHARACTER_KO", ko_event)
			dispatch(field_cards(live.attacking_player), "ON_ANY_CHARACTER_KO", ko_event)
			dispatch(field_cards(live.defending_player), "ON_ANY_CHARACTER_KO", ko_event)
			dispatch(field_cards(live.defending_player),
				"ON_DAMAGE_OR_HIGH_POWER_CHARACTER_KO", ko_event)
			-- "KO 당했을 때 또는 상대 효과로 이탈" 복합 타이밍(OP10-042 우솝
			-- 드로 등): 효과 이탈 분기는 after_remove가 쏘지만 원문의 KO절은
			-- 원인 불문이라 배틀 KO도 울려야 한다(유저 제보 2026-07-27:
			-- 상대 어택으로 드레스로자가 죽는 정상 시나리오에서 드로 침묵).
			dispatch(field_cards(live.defending_player),
				"ON_OWN_TRAIT_CHARACTER_KO_OR_LEFT_BY_OPPONENT_EFFECT", ko_event)
		end
		if target and live.final_target_is_character then
			-- "이번 턴 상대 캐릭터와 배틀했다" 조건용 기록
			opcg._battle_usage = opcg._battle_usage or setmetatable({}, {__mode="k"})
			opcg._battle_usage[attacker] = {
				turn = Duel.GetTurnCount(),
				opponent_character = true,
			}
			dispatch({attacker, target}, "AFTER_BATTLE_WITH_OPPONENT_CHARACTER", context)
		end
		dispatch(field_cards(live.attacking_player), "END_OF_BATTLE", context)
		dispatch(field_cards(live.defending_player), "END_OF_BATTLE", context)
		-- 카운터 버프는 '이 배틀 동안' — 전장에 살아남은 카드에서 지금 걷는다
		-- (전장을 떠난 카드는 RESETS_STANDARD가 이미 걷었다).
		for _, entry in ipairs(live.counter_effects) do
			if entry.card:IsLocation(LOCATION_MZONE) then entry.effect:Reset() end
		end
		-- 배틀 중 수집된 직결 트리거 배수 + THIS_BATTLE 지속 만료 경계
		if opcg.effect_queue then
			if opcg.effect_queue.drain_direct then
				opcg.effect_queue.drain_direct({}, nil, context)
			end
			if opcg.effect_queue.flush then opcg.effect_queue.flush() end
		end
		if opcg.runtime and opcg.runtime.advance_boundary then
			opcg.runtime.advance_boundary("END_OF_BATTLE", context)
		end
		B._live = nil
	end)
	Duel.RegisterEffect(finish, 0)

	-- ⑥ 둥 구조 불변식 — 네이티브 배틀 파괴는 lua 제거 경로(이탈 전
	-- ReturnAttachedDon)를 안 타므로, 숙주와 함께 트래시로 쓸려간 부착 둥을
	-- 착지 즉시 코스트 에리어로 레스트 귀환시킨다(공식 10-2-3의 사후 집행).
	-- 치환(REPLACE_KO)으로 살아남으면 애초에 떨어지지 않으니 자연 무해.
	local rescue = Effect.GlobalEffect()
	rescue:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
	rescue:SetCode(EVENT_TO_GRAVE)
	rescue:SetOperation(function(_, _, group)
		if opcg.RescueLooseDon then opcg.RescueLooseDon(array(group)) end
	end)
	Duel.RegisterEffect(rescue, 0)
end

-- 구 일괄 판정 진입점 tombstone: 잔존 호출 경로(rules.R.resolve_attack 래퍼,
-- 호출자 0곳)가 있어도 조용히 무시한다. 어택의 진짜 진입은 네이티브 t=9.
function B.resolve_attack(attacker, target, context)
	return false
end

-- 표시 전용 평가기 노출(하네스 검증용)
B.event_counter_expectation = event_counter_expectation
B.counter_expectation = counter_expectation
return B

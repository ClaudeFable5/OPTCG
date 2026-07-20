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
	-- 일괄 선택(min 0 = 사양 가능): 한 창에서 여러 장을 집고 뺄 수 있고,
	-- 0장 확정이 곧 거절이다 — 장당 예/아니오 왕복 없음. 마젠타 합산
	-- 프리뷰(⑤)가 이 선택 중 실시간으로 붙는다.
	Duel.Hint(HINT_SELECTMSG, player, B.COUNTER_SELECT_HINT)
	local picked = to_group(candidates):Select(player, 0, #candidates, nil)
	return array(picked)
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
	context.card = card
	context.player = live.defending_player
	context.event_target = card
	context.event_targets = {card}
	context.event_cards = {card}
	context.event_count = 1
	context.event_player = live.defending_player
	context.effect_play = true
	if opcg.contract_ops and opcg.contract_ops.emit then
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

local function run_counter_step(live)
	while true do
		local target = Duel.GetAttackTarget()
		if not target then return end
		local candidates = {}
		for _, card in ipairs(array(Duel.GetFieldGroup(live.defending_player, LOCATION_HAND, 0))) do
			local counter_value = opcg.GetCounter(card) or 0
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
		if #picked == 0 then return end
		-- 수치 카운터는 한 묶음으로 트래시 + 합산 한 방에 부여
		local chars = Group.CreateGroup()
		local total = 0
		for _, card in ipairs(picked) do
			local value = math.max(0, opcg.GetCounter(card) or 0)
			if value > 0 then
				chars:AddCard(card)
				total = total + value
			end
		end
		if total > 0 then
			Duel.SendtoGrave(chars, REASON_COST)
			apply_counter_power(live, target, total)
			live.counter_power = live.counter_power + total
		end
		-- 이벤트 카운터는 한 장씩 해석(공식 순차 사용) — 앞선 해석이 둥을
		-- 소모했을 수 있으니 장마다 지불 가능성을 재확인한다.
		local resolved_event = false
		for _, card in ipairs(picked) do
			if (opcg.GetCounter(card) or 0) <= 0 and opcg.IsEvent(card)
				and opcg.CanRestDon(live.defending_player, opcg.GetCost(card)) then
				resolve_event_counter(card, live)
				resolved_event = true
			end
		end
		-- 이벤트가 상태를 바꿨으면 창을 다시 연다(추가 사용 기회);
		-- 수치 카운터만 썼다면 전 후보가 이미 한 창에 나왔으니 종료.
		if not resolved_event then return end
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
		if not opcg.IsRested(attacker) then opcg.SetRested(attacker) end
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
		-- 어택시 창 마감 펌프: 선행 임의효과 거절로 표류 중인 [상대의 어택 시]
		-- 계열 잔여 후보를 블록 프롬프트 전에 완주시킨다(타이밍 통일).
		if opcg.effect_queue and opcg.effect_queue.pump_window then
			opcg.effect_queue.pump_window()
		end
		local live = live_for(attacker)
		local blocker = select_blocker(live.defending_player, blocker_candidates(live))
		if blocker then
			live.blocker = blocker
			opcg.SetRested(blocker)
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
		local current = Duel.GetAttackTarget() or target
		dispatch({attacker, current}, "WHEN_ATTACKING_OR_ATTACKED", live.context)
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
		if target and live.final_target_is_character
			and target:IsLocation(LOCATION_MZONE)
			and attacker and attacker:GetAttack() >= target:GetAttack() then
			opcg.ReturnAttachedDon(target)
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
			dispatch({target}, "ON_SELF_KO", context)
			dispatch(field_cards(live.attacking_player),
				"ON_OPPONENT_CHARACTER_KO", context)
			dispatch(field_cards(live.attacking_player), "ON_ANY_CHARACTER_KO", context)
			dispatch(field_cards(live.defending_player), "ON_ANY_CHARACTER_KO", context)
			-- 아군 캐릭터 KO 청취(OP13-002 E2 등): 효과 KO는 after_remove가
			-- 쏘지만 배틀 KO는 그 경로를 안 타므로 여기서 쏜다. 판정 대상은
			-- event_target에 박은 깨끗한 사본으로 — live.context를 그대로 주면
			-- 리더 히트가 남긴 damage가 조건의 '데미지 받음' 분기를 오발시킨다.
			local ko_event = {}
			for key, value in pairs(context or {}) do ko_event[key] = value end
			ko_event.damage = nil
			ko_event.event_damage = nil
			ko_event.event_target = target
			ko_event.event_targets = {target}
			ko_event.event_cards = {target}
			ko_event.event_count = 1
			dispatch(field_cards(live.defending_player),
				"ON_DAMAGE_OR_HIGH_POWER_CHARACTER_KO", ko_event)
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

return B

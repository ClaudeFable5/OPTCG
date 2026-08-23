-- Implementations for the extended operators declared by opcg_contract.lua.
-- Kept separate from opcg_core.lua so the bridge stays readable.
opcg = opcg or {}
opcg.contract_ops = opcg.contract_ops or {}
local X = opcg.contract_ops

opcg.EFFECT_CANNOT_ATTACK_TARGETS = opcg.EFFECT_CANNOT_ATTACK_TARGETS or 0x7f4f1210
opcg.EFFECT_CANNOT_LEAVE_FIELD = opcg.EFFECT_CANNOT_LEAVE_FIELD or 0x7f4f1211
opcg.EFFECT_CANNOT_PLAY = opcg.EFFECT_CANNOT_PLAY or 0x7f4f1212
opcg.EFFECT_CANNOT_SET_DON_ACTIVE = opcg.EFFECT_CANNOT_SET_DON_ACTIVE or 0x7f4f1213
opcg.EFFECT_CANNOT_TAKE_LIFE = opcg.EFFECT_CANNOT_TAKE_LIFE or 0x7f4f1214
opcg.EFFECT_NEGATE_TIMING = opcg.EFFECT_NEGATE_TIMING or 0x7f4f1215
opcg.EFFECT_PLAY_RESTED = opcg.EFFECT_PLAY_RESTED or 0x7f4f1216
opcg.EFFECT_REQUIRE_ATTACK_DISCARD = opcg.EFFECT_REQUIRE_ATTACK_DISCARD or 0x7f4f1217
opcg.EFFECT_NAME_ALIAS = opcg.EFFECT_NAME_ALIAS or 0x7f4f1218
opcg.EFFECT_REPLACE_KO = opcg.EFFECT_REPLACE_KO or 0x7f4f1219
opcg.EFFECT_REPLACE_LEAVE = opcg.EFFECT_REPLACE_LEAVE or 0x7f4f121a
opcg.EFFECT_REPLACE_REST = opcg.EFFECT_REPLACE_REST or 0x7f4f121b
opcg.EFFECT_REPLACE_LIFE_TO_HAND = opcg.EFFECT_REPLACE_LIFE_TO_HAND or 0x7f4f121c
opcg.EFFECT_DON_PHASE_ATTACH = opcg.EFFECT_DON_PHASE_ATTACH or 0x7f4f121d
opcg.EFFECT_MODIFY_HAND_COST = opcg.EFFECT_MODIFY_HAND_COST or 0x7f4f121e

local function other(player) return 1 - player end
local function source_player(context)
	if context.player ~= nil then return context.player end
	if context.card then return context.card:GetControler() end
	return Duel.GetTurnPlayer()
end
local function resolve_player(value, context)
	return opcg.ResolvePlayer(value or "YOU", context)
end
local function choose_number_up_to(player, maximum, mode)
	maximum = math.max(0, maximum or 0)
	if mode ~= "UP_TO" or maximum == 0 then return maximum end
	local choices = {}
	for value = 0, maximum do choices[#choices + 1] = value end
	if Duel.AnnounceNumber then return Duel.AnnounceNumber(player, table.unpack(choices)) end
	if Duel.SelectOption then return Duel.SelectOption(player, table.unpack(choices)) end
	return maximum
end
local function to_group(cards)
	local group = Group.CreateGroup()
	for _, card in ipairs(cards or {}) do group:AddCard(card) end
	return group
end
local function from_group(group)
	local cards = {}
	for card in aux.Next(group) do cards[#cards + 1] = card end
	return cards
end
local function remember(context, cards)
	context.last_targets = cards or {}
	context.last_target = cards and cards[1] or nil
	context.last_action_succeeded = cards ~= nil and #cards > 0
	return cards or {}
end
local function choose(selector, context)
	local cards, reason = opcg.SelectCards(selector, context)
	if cards == nil then error(reason or "selector failed") end
	return remember(context, cards)
end
local function filter_for(filter, context)
	return assert(opcg.CompileFilter(filter or {}, context), "unsupported OPCG filter")
end
local function select_zone(player, locations, filter, minimum, maximum, chooser, context)
	local group = Duel.GetMatchingGroup(filter_for(filter, context), player, locations, 0, nil)
	if group:GetCount() < minimum then error("not enough cards") end
	maximum = math.min(maximum, group:GetCount())
	if maximum == 0 then return {} end
	return from_group(group:Select(chooser, minimum, maximum, nil))
end
local function reset_for(duration, source)
	-- battle durations really expire at the END_OF_BATTLE boundary (see
	-- attach_reset); PHASE_END is only the can't-leak-past-the-turn fallback
	if duration == "THIS_BATTLE" or duration == "END_OF_BATTLE" then
		return RESET_PHASE + PHASE_END, 1
	end
	if duration == "THIS_TURN" or duration == "TURN_PLAYED" or duration == nil then
		return RESET_PHASE + PHASE_END, 1
	end
	-- [2026-08-15 유저 제보·지시, OP15-023 아론] 턴 소속형 기간은 코어의 페이즈
	-- 리셋 턴 비트로 센다: RESET_SELF_TURN = 효과 핸들러(대상 카드)의 턴만,
	-- RESET_OPPO_TURN = 그 상대 턴만 카운트(effect.cpp RESET_PHASE 분기). 그러면
	-- 시전 시점이 누구 턴이든 count 1이 정확히 "다음 X의 해당 페이즈"다.
	-- 종전엔 비트 없이(=양쪽 턴 모두 카운트) 시전 턴으로 1/2를 계산했는데
	-- 그 계산이 뒤집혀 있어 상대 턴에 KO된 아론의 동결이 내 리프레시에 풀렸다.
	-- 주의: 핸들러 = 효과가 '등록된 카드'(대상). YOUR/OPPONENT는 시전자 기준이라
	-- 대상 소유자와 비교해 비트를 고른다(대상 없이 전역 등록되면 시전자 기준).
	local owner = source and source:GetControler() or Duel.GetTurnPlayer()
	local function turn_bit(target_player, want_owner_turn)
		-- 원하는 턴이 대상 카드 소유자의 턴이면 SELF, 아니면 OPPO
		local target = target_player == nil and owner or target_player
		local wanted = want_owner_turn and owner or (1 - owner)
		return (wanted == target) and RESET_SELF_TURN or RESET_OPPO_TURN
	end
	local target_player = X._reset_target_player  -- attach_reset이 세팅
	local current = Duel.GetTurnPlayer()
	-- 원하는 턴의 페이즈만 세므로 count는 항상 1 - 단, "다음 X의 턴 종료"를
	-- 그 X의 턴 도중에 걸면 이번 턴 END가 먼저 잡히므로 2(현재 턴 END 통과).
	-- 리프레시(턴 시작)는 이미 지나간 페이즈라 도중에 걸어도 다음 것이 1번째.
	if duration == "UNTIL_YOUR_NEXT_TURN_START" or duration == "UNTIL_YOUR_NEXT_REFRESH" then
		return RESET_PHASE + PHASE_DRAW + turn_bit(target_player, true), 1
	end
	if duration == "UNTIL_YOUR_NEXT_TURN_END" then
		return RESET_PHASE + PHASE_END + turn_bit(target_player, true), (current == owner) and 2 or 1
	end
	if duration == "UNTIL_OPPONENT_NEXT_TURN_END" then
		return RESET_PHASE + PHASE_END + turn_bit(target_player, false), (current ~= owner) and 2 or 1
	end
	if duration == "UNTIL_OPPONENT_NEXT_REFRESH" then
		return RESET_PHASE + PHASE_DRAW + turn_bit(target_player, false), 1
	end
	return nil
end
local function attach_reset(effect, duration, source, target)
	-- target = 효과가 등록될 카드(핸들러). reset_for의 턴 비트 계산에 소유자 제공.
	X._reset_target_player = target and target.GetControler and target:GetControler() or nil
	local reset, count = reset_for(duration, source)
	X._reset_target_player = nil
	-- 카드에 부착되는 기간제 효과는 그 카드가 필드를 떠나면 즉시 소멸해야
	-- 한다(총합룰: 필드를 떠난 카드는 별개 취급). 종전엔 페이즈 타이머만 있어
	-- 바운스/소생으로 되돌아온 같은 카드가 어택 금지 등을 그대로 짊어졌다
	-- (OP14-120 유저 제보). 전역 등록 효과에는 이벤트 리셋이 무의미할 뿐 무해.
	if reset then effect:SetReset(reset + RESET_EVENT + RESETS_STANDARD, count or 1) end
	-- OPCG has no native damage phase: battle durations expire at the battle
	-- machine's END_OF_BATTLE boundary, the native reset is only a fallback.
	if duration == "THIS_BATTLE" or duration == "END_OF_BATTLE" then
		X.schedule("THIS_BATTLE_END", source, function() effect:Reset() end)
	end
end
-- [2026-08-10 OP07-026 재수리] 둥(오버레이) 낱장 동결 전용: SINGLE 이펙트는
-- 오버레이 카드에서 코어 집계에 안 잡히므로 플래그로 나른다(레스트 상태와
-- 같은 원시). 리셋 수식은 single_effect와 동일 규약.
local function freeze_don_flag(card, duration, source)
	-- 플래그 핸들러 = 둥 카드 자신 → 소유자 기준 턴 비트
	X._reset_target_player = card:GetControler()
	local reset, count = reset_for(duration, source)
	X._reset_target_player = nil
	card:RegisterFlagEffect(opcg.FLAG_DON_FREEZE,
		(reset or 0) + RESET_EVENT + RESETS_STANDARD, 0, count or 1)
end
-- [2026-08-12 유저 요청, OP08-023류] 효과로 부여된 상태를 카드 호버 툴팁에
-- 표기한다. 코어 무수정: EFFECT_FLAG_CLIENT_HINT가 붙은 효과는 부여 시점에
-- CHINT_DESC_ADD, 리셋(기간 만료) 시점에 REMOVE를 자동 발신하고, 클라는
-- 호버 툴팁에 *줄로 그린다(event_handler의 desc_hints). 문자열은 저장소
-- strings.conf의 !system 880020대(0x100000 미만 = 시스템 스트링 규약).
local STATUS_HINT_DESC = {
	[EFFECT_CANNOT_ATTACK]=880020,
	[opcg.EFFECT_CANNOT_ATTACK_LEADER]=880021,
	[opcg.EFFECT_CANNOT_SET_ACTIVE]=880022,
	[opcg.EFFECT_CANNOT_BE_RESTED]=880023,
	[opcg.EFFECT_CANNOT_LEAVE_FIELD]=880024,
	[opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION]=880025,
	[EFFECT_CANNOT_SELECT_BATTLE_TARGET]=880026,
	[EFFECT_INDESTRUCTABLE]=880027,
	[EFFECT_INDESTRUCTABLE_EFFECT]=880028,
	[EFFECT_INDESTRUCTABLE_BATTLE]=880029,
	[EFFECT_DISABLE]=880030,
}
local function single_effect(source, target, code, value, duration)
	local effect = Effect.CreateEffect(source)
	effect:SetType(EFFECT_TYPE_SINGLE)
	effect:SetCode(code)
	local hint = STATUS_HINT_DESC[code]
	if hint then
		effect:SetDescription(hint)
		effect:SetProperty(EFFECT_FLAG_CLIENT_HINT)
	end
	opcg.SetEffectValue(effect, value)
	attach_reset(effect, duration, source, target)
	target:RegisterEffect(effect)
	return effect
end
local function apply_selector_effect(action, context, code, value, extras)
	-- extras: 같은 선택 대상에게 같은 기간으로 얹는 동반 효과 {{code, value}, ...}
	-- (재선택 프롬프트 없이 한 번 고른 카드들에 전부 부여)
	local cards = choose(action.selector, context)
	for _, card in ipairs(cards) do
		single_effect(context.card, card, code, value, action.duration)
		for _, extra in ipairs(extras or {}) do
			single_effect(context.card, card, extra[1], extra[2], action.duration)
		end
	end
	return cards
end
local function modify(source, target, code, value, duration)
	return single_effect(source, target, code, value, duration)
end
local function trash(cards, reason)
	reason = reason or REASON_EFFECT
	if X.before_remove then
		cards = X.before_remove(cards, reason, "TRASH", X.current_context)
	end
	local group = to_group(cards)
	if opcg.RecordDonAtLeave then opcg.RecordDonAtLeave(cards) end -- 둥 요구치 스냅샷
	-- [2026-08-10 유저 재정] 선제 둥 반환 폐지(내성 잔존 시 둥 유지) —
	-- 실제 이탈분은 EVENT_TO_GRAVE 워처가 코스트로 레스트 귀환시킨다.
	local moved = Duel.SendtoGrave(group, reason)
	if X.after_remove then X.after_remove(cards, reason, "TRASH", X.current_context) end
	return moved
end
local function play(card, player, chooser, rested)
	if opcg.IsCharacter(card) then
		if opcg.GetCharacters(player):GetCount() >= 5 then
			local replaced = opcg.GetCharacters(player):Select(chooser, 1, 1, nil):GetFirst()
			if not replaced then return false end
			trash({replaced}, REASON_RULE)
		end
		local forced_rested = X.player_has(player, opcg.EFFECT_PLAY_RESTED, card)
		local position = (rested or forced_rested) and POS_FACEUP_DEFENSE or POS_FACEUP_ATTACK
		local ok = Duel.MoveToField(card, player, player, LOCATION_MZONE, position, true, 0x1f)
		if ok and opcg.EmitPlayed then opcg.EmitPlayed(card, player, X.current_context) end
		return ok
	end
	if opcg.IsStage(card) then
		local old = opcg.GetStage(player)
		if old then trash({old}, REASON_RULE) end
		local ok = Duel.MoveToField(card, player, player, LOCATION_FZONE,
			rested and POS_FACEUP_DEFENSE or POS_FACEUP_ATTACK, true)
		if ok and opcg.EmitPlayed then opcg.EmitPlayed(card, player, X.current_context) end
		return ok
	end
	return false
end
local function life_cards(player)
	return from_group(Duel.GetFieldGroup(player, LOCATION_EXTRA, 0))
end
local function sort_life(cards, top_first)
	table.sort(cards, function(a, b)
		if top_first then return a:GetSequence() > b:GetSequence() end
		return a:GetSequence() < b:GetSequence()
	end)
	return cards
end
local function apply_life_order(bottom_to_top)
	-- The OPCG core honors the requested sequence inside the life stack
	-- (0 = bottom). Cards already in place move nothing, so a "look and put
	-- it back" reorder is wire-silent instead of rewriting the whole fan.
	for index, card in ipairs(bottom_to_top or {}) do
		if card and card:IsLocation(LOCATION_EXTRA) and card:GetSequence() ~= index - 1 then
			Duel.MoveSequence(card, index - 1)
		end
	end
end
local function life_top(player)
	return sort_life(life_cards(player), true)[1]
end
local function send_life(card, player, faceup, bottom)
	local moved = Duel.Sendto(card, LOCATION_EXTRA, REASON_EFFECT,
		faceup and POS_FACEUP_DEFENSE or POS_FACEDOWN_DEFENSE, player, 0)
	if moved and moved ~= 0 and bottom and card:IsLocation(LOCATION_EXTRA) then Duel.MoveSequence(card, 0) end
	return moved and moved ~= 0
end
local function execute_nested(actions, context)
	local previous_action_succeeded = true
	for _, action in ipairs(actions or {}) do
		if action["then"] == true and previous_action_succeeded ~= true then
			context.last_action_succeeded = false
			context.last_action_effected = false
		else
			-- IF/CHOOSE read the previous action's outcome in their own
			-- conditions - do not wipe it before they run (see runtime loop).
			if action.op ~= "IF" and action.op ~= "CHOOSE" then
				context.last_action_succeeded = nil
				context.last_action_effected = nil
			end
			OPCGCore.ExecuteAction(action.op, action, context)
			if context.last_action_succeeded == nil then context.last_action_succeeded = true end
			if context.last_action_effected == nil then
				context.last_action_effected = context.last_action_succeeded
			end
		end
		previous_action_succeeded = context.last_action_succeeded == true
	end
end
local function conditions_match(conditions, context)
	for _, condition in ipairs(conditions or {}) do
		if not OPCGCore.CheckCondition(condition.op, condition, context) then return false end
	end
	return true
end

function X.player_has(player, code, target, context, reason)
	-- reason: 관문 식별자("PLAY"=기동 일반 등장 / "EFFECT"=효과 등장 관문).
	-- reason=EFFECT 제약(OP12-036 조로류)이 일반 등장을 놓아주기 위해 값
	-- 함수 4번째 인자로 흘린다. 무표시 호출은 nil로 전달된다.
	if not Duel.IsPlayerAffectedByEffect then return false end
	for _, effect in ipairs({Duel.IsPlayerAffectedByEffect(player, code)}) do
		local value = opcg.GetEffectValue(effect)
		if type(value) ~= "function" or value(effect, target, context, reason) then return true end
	end
	return false
end
function X.timing_negated(card, timing, context)
	if not Duel.IsPlayerAffectedByEffect then return false end
	local player = card:GetControler()
	for _, effect in ipairs({Duel.IsPlayerAffectedByEffect(player, opcg.EFFECT_NEGATE_TIMING)}) do
		local value = opcg.GetEffectValue(effect)
		if type(value) == "function" then
			if value(effect, timing, card, context) then return true end
		elseif value == timing then
			return true
		end
	end
	return false
end

local function player_effect(source, player, code, value, duration)
	local effect = Effect.CreateEffect(source)
	effect:SetType(EFFECT_TYPE_FIELD)
	effect:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	effect:SetCode(code)
	effect:SetTargetRange(player == source:GetControler() and 1 or 0,
		player == source:GetControler() and 0 or 1)
	opcg.SetEffectValue(effect, value)
	attach_reset(effect, duration, source, source)  -- 필드 효과 핸들러 = 시전자 카드
	Duel.RegisterEffect(effect, source:GetControler())
	return effect
end

local function cannot_play_value(action, source, predicate)
	-- CANNOT_PLAY의 DSL 존중(2026-08-07 유저 제보, OP12-036 조로 "패의 이
	-- 카드는 효과로 등장할 수 없다"): selector SELF면 자기 자신만 막고,
	-- reason=EFFECT면 기동 일반 등장(관문 reason "PLAY")은 놓아준다 —
	-- 무표시 경로는 안전하게 차단 쪽으로 떨어진다.
	local self_only = action.selector and action.selector.kind == "SELF"
	local effect_only = action.reason == "EFFECT"
	return function(_, target, _, play_reason)
		if target == nil then return false end
		if self_only and target ~= source then return false end
		if not predicate(target) then return false end
		if effect_only and play_reason == "PLAY" then return false end
		return true
	end
end

local function ko_protection(action, context)
	local reason = action.reason or "ANY"
	local attacker = action.attacker_filter and filter_for(action.attacker_filter, context)
	local source_filter = action.source_filter and filter_for(action.source_filter, context)
	if reason == "BATTLE" then
		return EFFECT_INDESTRUCTABLE_BATTLE, function(_, opponent)
			return not attacker or (opponent ~= nil and attacker(opponent))
		end
	end
	if reason == "OPPONENT_EFFECT" or reason == "EFFECT"
		or reason == "CHARACTER_EFFECT" then
		return EFFECT_INDESTRUCTABLE_EFFECT, function(effect, reason_effect, reason_player)
			if reason == "OPPONENT_EFFECT" and reason_player == effect:GetHandlerPlayer() then return false end
			local source = reason_effect and reason_effect:GetHandler()
			if reason == "CHARACTER_EFFECT" and (not source or not opcg.IsCharacter(source)) then return false end
			if source_filter and source and not source_filter(source) then return false end
			return true
		end
	end
	return EFFECT_INDESTRUCTABLE, function() return true end
end

local restriction_code = {
	CANNOT_ATTACK=EFFECT_CANNOT_ATTACK,
	ALLOW_ATTACK_ACTIVE_CHARACTER=opcg.EFFECT_ALLOW_ATTACK_ACTIVE_CHARACTER,
	ALLOW_ATTACK_CHARACTER=opcg.EFFECT_ALLOW_ATTACK_CHARACTER,
	CANNOT_ATTACK_LEADER=opcg.EFFECT_CANNOT_ATTACK_LEADER,
	CANNOT_SET_ACTIVE=opcg.EFFECT_CANNOT_SET_ACTIVE,
	CANNOT_BE_RESTED=opcg.EFFECT_CANNOT_BE_RESTED,
	PREVENT_BLOCKER_ACTIVATION=opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION,
}

local function restriction_value(action, context)
	local predicate = action.filter and filter_for(action.filter, context) or nil
	local target_predicate = action.target_filter and filter_for(action.target_filter, context) or nil
	return function(_, target)
		if predicate and target and not predicate(target) then return false end
		if target_predicate and target and not target_predicate(target) then return false end
		return true
	end
end

-- CANNOT_BE_RESTED 효과에 심는 값 함수. CanBeRested/SetRested가 넘기는
-- {cause, source_player}로 막을지 판별한다:
--   reason 무지정/ANY = "레스트로 할 수 없다"(전면형) - 원인 불문 전부 차단.
--   reason=OPPONENT_EFFECT = "상대의 효과로 레스트 되지 않는다" - 상대 효과의
--   레스트만 차단, 자기 어택 선언·블록·비용 레스트는 통과(종전엔 이것까지
--   막혀 어택 후 액티브로 남는 잠복 결함이 있었다).
local function rest_block_value(action, context)
	local base = restriction_value(action, context)
	local reason = action.reason
	return function(effect, target, ctx)
		if not base(effect, target, ctx) then return false end
		if reason ~= "OPPONENT_EFFECT" then return true end
		local cause = ctx and ctx.cause or "EFFECT"
		if cause ~= "EFFECT" then return false end
		local owner = effect and effect.GetHandler and effect:GetHandler()
		owner = owner and owner:GetControler()
		if ctx and ctx.source_player ~= nil and ctx.source_player == owner then return false end
		return true
	end
end

local function execute_restriction(op, action, context)
	if action.schedule then
		-- OP15-025 크로: "이번 턴 종료 시, ..." - 제약 부여(대상 선택·필터 판정
		-- 포함)를 경계 시점으로 미룬다. 그 시점의 레스트·부여둥 상태로 고른다.
		local scheduled = {}
		for key, value in pairs(action) do scheduled[key] = value end
		scheduled.schedule = nil
		assert(X.schedule(action.schedule, context.card,
			function() execute_restriction(op, scheduled, context) end), "unsupported schedule")
		return {}
	end
	if op == "CANNOT_BE_RESTED" then
		-- 총합룰상 어택 선언(6-1-2)과 블로커 발동(6-3-2)은 그 카드를 "레스트로
		-- 하는" 행위 자체 - 전면형은 레스트가 불가능하므로 어택 선언도 불가능
		-- 해야 한다(유저 제보: 페로나 대상이 레스트만 안 되고 어택은 됨).
		-- 네이티브 CANNOT_ATTACK을 같은 대상·같은 기간으로 동반 부여해 코어
		-- 어택 후보에서부터 걸러낸다. OPPONENT_EFFECT형은 어택이 정상이라 제외.
		local extras = action.reason ~= "OPPONENT_EFFECT"
			and { { EFFECT_CANNOT_ATTACK, restriction_value(action, context) } } or nil
		return apply_selector_effect(action, context, opcg.EFFECT_CANNOT_BE_RESTED,
			rest_block_value(action, context), extras)
	end
	if op == "PREVENT_BLOCKER_ACTIVATION" and action.attacker_selector and not action.selector then
		action = {
			selector=action.attacker_selector, duration=action.duration,
			filter=action.filter, target_filter=action.target_filter,
		}
	elseif op == "PREVENT_BLOCKER_ACTIVATION" and not action.selector then
		action.selector = {owner="YOU", kind="SELF", count=1, mode="EXACT"}
	end
	if op == "CANNOT_ATTACK_TARGETS" then
		action = {
			selector=action.attacker_selector, duration=action.duration,
			target_filter=action.target_filter,
		}
	end
	-- 코어 get_attack_target가 소비하는 스톡 코드로 등록해야 어택 후보에서
	-- 실제로 걸러진다 (커스텀 0x7f4f1210은 소비자 없는 사코드였음 - OP12-020).
	local code = op == "CANNOT_ATTACK_TARGETS" and EFFECT_CANNOT_SELECT_BATTLE_TARGET
		or restriction_code[op]
	return apply_selector_effect(action, context, code, restriction_value(action, context))
end

local function action_play_from_deck(action, context)
	local player = resolve_player(action.player, context)
	local chooser = source_player(context)
	local minimum = action.mode == "EXACT" and (action.count or 1) or 0
	local cards = select_zone(player, LOCATION_DECK, action.filter, minimum, action.count or 1, chooser, context)
	if action.reveal ~= false and #cards > 0 then Duel.ConfirmCards(other(chooser), to_group(cards)) end
	if action.destination == "HAND" then Duel.SendtoHand(to_group(cards), player, REASON_EFFECT)
	else
		local played = {}
		for _, card in ipairs(cards) do
			if play(card, player, chooser, action.rested == true) then played[#played + 1] = card end
		end
		cards = played
	end
	return remember(context, cards)
end

local function action_life_reorder(action, context)
	local player = resolve_player(action.player, context)
	local chooser = source_player(context)
	if action.player == "ANY" then
		-- cost-host card texts str7/str8 = "자신의 라이프/상대의 라이프"
		local target = Duel.SelectOption and Duel.SelectOption(chooser,
			aux.Stringid(opcg.DON_COST_HOST_ID or 879999999, 6),
			aux.Stringid(opcg.DON_COST_HOST_ID or 879999999, 7)) or 0
		player = target == 0 and chooser or other(chooser)
	elseif action.choose_player then
		chooser = player
	end
	local top_first = sort_life(life_cards(player), true)
	local bottom_first = sort_life(life_cards(player), false)
	local count = choose_number_up_to(chooser, math.min(action.count or #top_first, #top_first), action.mode)
	if count == 0 then context.last_action_succeeded = action.mode == "UP_TO" return {} end
	local selected = {}
	local selected_set = {}
	for index = 1, count do
		selected[index] = top_first[index]
		selected_set[selected[index]] = true
	end
	-- the LOOK part: the chooser privately sees the cards before reordering
	Duel.ConfirmCards(chooser, to_group(selected))
	-- [2026-08-12 유저 제보 OP03-099] "라이프로 되돌린다" = 뒷면 복귀. 봤던
	-- 카드가 앞면(선행 효과로 공개돼 있던 것)이면 뒷면(수비)으로 되돌린다.
	for _, card in ipairs(selected) do
		if card:IsPosition(POS_FACEUP) then
			Duel.ChangePosition(card, POS_FACEDOWN_DEFENSE)
		end
	end
	if action.destinations then
		local bottom_dest, top_dest = {}, {}
		for _, card in ipairs(selected) do
			-- cost-host card texts str5/str6 = "라이프 맨 위로/맨 아래로"
			local destination = Duel.SelectOption(chooser,
				aux.Stringid(opcg.DON_COST_HOST_ID or 879999999, 4),
				aux.Stringid(opcg.DON_COST_HOST_ID or 879999999, 5))
			if destination == 1 then bottom_dest[#bottom_dest + 1] = card
			else top_dest[#top_dest + 1] = card end
		end
		local desired = {}
		for index = #bottom_dest, 1, -1 do desired[#desired + 1] = bottom_dest[index] end
		for _, card in ipairs(bottom_first) do
			if not selected_set[card] then desired[#desired + 1] = card end
		end
		for index = #top_dest, 1, -1 do desired[#desired + 1] = top_dest[index] end
		apply_life_order(desired)
	else
		local candidates = {}
		for _, card in ipairs(selected) do candidates[#candidates + 1] = card end
		local ordered = {}
		for _ = 1, #selected do
			local group = to_group(candidates)
			local card = group:Select(chooser, 1, 1, nil):GetFirst()
			if card then
				ordered[#ordered + 1] = card
				for i, value in ipairs(candidates) do if value == card then table.remove(candidates, i) break end end
			end
		end
		local desired = {}
		for _, card in ipairs(bottom_first) do
			if not selected_set[card] then desired[#desired + 1] = card end
		end
		for _, card in ipairs(ordered) do desired[#desired + 1] = card end
		apply_life_order(desired)
	end
	context.last_action_succeeded = true
	return remember(context, selected)
end

local function action_power_by_count(action, context, source_cards, destination, on_removed)
	local player = resolve_player(action.player, context)
	local chooser = source_player(context)
	local cards = source_cards(player, chooser)
	if destination == "TRASH" then trash(cards, REASON_EFFECT + REASON_DISCARD)
	elseif destination == "KO" then trash(cards, REASON_EFFECT + REASON_DESTROY)
	elseif destination == "HAND" and #cards > 0 then Duel.SendtoHand(to_group(cards), player, REASON_EFFECT)
	elseif destination == "DECK_BOTTOM" and #cards > 0 then
		Duel.SendtoDeck(to_group(cards), player, SEQ_DECKBOTTOM, REASON_EFFECT)
		if action.order == "CHOOSE" and #cards > 1 then Duel.SortDeckbottom(chooser, player, #cards) end
	elseif destination == "REST_DON" then
		opcg.RestDon(player, #cards)
	end
	if on_removed then on_removed(cards, player) end
	local amount = math.floor(#cards / (action.divisor or 1)) * (action.amount_per or 0)
	local targets = choose(action.selector, context)
	for _, card in ipairs(targets) do modify(context.card, card, EFFECT_UPDATE_ATTACK, amount, action.duration) end
	context.last_action_succeeded = #cards > 0
	return targets
end

-- 자신의 카드에 의해 패가 버려진 사건(쿠잔류 트리거의 발신원). 효과 버림은
-- 여기(액션 실행부), 코스트 버림은 core PayCost의 emit_cost_hand_discard가
-- 발신한다 - 코스트 포함이 실전 재정(청 쿠잔 아키타입 설계 근거, 2026-07-16).
-- source_card = 버리게 만든 카드(리스너 덮어쓰기 회피 키).
local function emit_hand_discard(cards, context, player)
	if #(cards or {}) == 0 or not X.emit then return end
	local event = {}
	for key, value in pairs(context or {}) do event[key] = value end
	event.event_cards = cards
	event.event_count = #cards
	event.event_player = player
	event.source_card = context and context.card or nil
	X.emit("ON_HAND_DISCARDED_BY_TRAIT_EFFECT", event, player)
end

function X.execute(op, action, context)
	context = context or {}
	local player = resolve_player(action.player, context)
	local chooser = source_player(context)
	if op == "CANNOT_BE_KO" then
		local code, value = ko_protection(action, context)
		local cards = choose(action.selector, context)
		for _, card in ipairs(cards) do
			local native = single_effect(context.card, card, code, value, action.duration)
			if action.limit == "ONCE_PER_TURN" then native:SetCountLimit(1) end
		end
		return cards
	elseif restriction_code[op] or op == "CANNOT_ATTACK_TARGETS" then
		return execute_restriction(op, action, context)
	elseif op == "NEGATE_EFFECTS" then
		local cards = choose(action.selector, context)
		for _, card in ipairs(cards) do
			local e1 = single_effect(context.card, card, EFFECT_DISABLE, 1, action.duration)
			local e2 = single_effect(context.card, card, EFFECT_DISABLE_EFFECT, 1, action.duration)
			-- [2026-08-15 와다츠미 2장 리플레이 20:11 실측] 자기 자신을 무효화하는
			-- 효과(소유자==핸들러)는 코어 is_available 규칙상 "무효 카드의 효과"로
			-- 함께 꺼져 STATUS_DISABLED가 켜졌다 풀렸다 플래핑한다(리플레이: 두
			-- 장이 번갈아 st=1025/1024, 최종 한 장만 무효). 유희왕 자기-무효
			-- 관례대로 CANNOT_DISABLE 플래그로 이 DISABLE 효과 자체는 무효 상태
			-- 에서도 살아있게 한다(대상이 남이면 무관하나 무해).
			if card == context.card then
				-- SetProperty는 덮어쓰기라 기존 플래그(CLIENT_HINT 등)를 OR로 보존
				local p1, q1 = e1:GetProperty() e1:SetProperty((p1 or 0) | EFFECT_FLAG_CANNOT_DISABLE, q1 or 0)
				local p2, q2 = e2:GetProperty() e2:SetProperty((p2 or 0) | EFFECT_FLAG_CANNOT_DISABLE, q2 or 0)
			end
		end
		return cards
	elseif op == "ADD_NAME_ALIAS" then
		return apply_selector_effect(action, context, opcg.EFFECT_NAME_ALIAS, action.name)
	elseif op == "SET_BASE_POWER" or op == "SET_POWER" or op == "SET_COST" then
		local code = op == "SET_BASE_POWER" and EFFECT_SET_BASE_ATTACK
			or op == "SET_POWER" and EFFECT_SET_ATTACK_FINAL or EFFECT_CHANGE_LEVEL
		local cards = choose(action.selector, context)
		for _, card in ipairs(cards) do modify(context.card, card, code, action.value or 0, action.duration) end
		return cards
	elseif op == "SET_BASE_POWER_FROM_TARGET" then
		local sources = choose(action.source_selector, context)
		-- 참조값 = 대상의 '현재' 파워(유저 재정 2026-08-09, EB01-061 제보:
		-- "~와 같은 파워"는 변동 포함 해결 시점 수치). "원래 파워와 같은
		-- 파워"를 명기한 카드(OP14-053 비스타)만 reference=BASE로 원래 파워.
		local value = 0
		if sources[1] then
			value = action.reference == "BASE" and opcg.GetBasePower(sources[1])
				or opcg.GetPower(sources[1])
		end
		local targets = choose(action.selector, context)
		for _, card in ipairs(targets) do modify(context.card, card, EFFECT_SET_BASE_ATTACK, value, action.duration) end
		return targets
	elseif op == "SWAP_BASE_POWER" then
		-- 두 카드의 원래 파워를 서로 맞바꾼다. 두 값을 먼저 읽어야 원자적으로
		-- 교환된다(먼저 덮으면 두 번째 읽기가 오염됨). 대상은 한 셀렉터 2장이나
		-- 두 셀렉터 각 1장(리더+캐릭터 - OP14-009)로 지정한다.
		local a, b
		if action.second_selector then
			a = choose(action.selector, context)[1]
			b = choose(action.second_selector, context)[1]
		else
			local cards = choose(action.selector, context)
			a, b = cards[1], cards[2]
		end
		context.last_action_succeeded = a ~= nil and b ~= nil
		if a and b then
			local pa, pb = opcg.GetBasePower(a), opcg.GetBasePower(b)
			modify(context.card, a, EFFECT_SET_BASE_ATTACK, pb, action.duration)
			modify(context.card, b, EFFECT_SET_BASE_ATTACK, pa, action.duration)
			return { a, b }
		end
		return {}
	elseif op == "MODIFY_POWER_SPLIT" then
		-- 순차 처리(2026-08-06 유저 하달, OP08-118): 2장을 한 창에서 고르는
		-- 대신 첫 장을 골라 -3000을 바로 적용하고, 남은 후보에서 둘째 장을
		-- 골라 -2000을 적용한다. 첫 선택을 취소하면 이후 단계도 중단
		-- ("1장을 -3000하고, 나머지는 -2000" — 나머지는 첫 장이 있어야 존재).
		-- 단계별 상단 안내문은 금액별 !system 스트링(SELECT_HINT_BY_AMOUNT).
		local selector = action.selector or {}
		local picker = selector.chooser == "OPPONENT" and (1 - chooser) or chooser
		local minimum = selector.mode == "EXACT" and 1 or 0
		local picked = {}
		for index = 1, selector.count or 2 do
			local amount = (index <= (action.primary_count or 1)
				and action.primary_amount or action.secondary_amount) or 0
			local candidates = assert(opcg.GetCandidateGroup(selector, context), "unsupported OPCG selector")
			for _, previous in ipairs(picked) do candidates:RemoveCard(previous) end
			if candidates:GetCount() == 0 then break end
			local hint = opcg.SELECT_HINT_BY_AMOUNT[amount]
			if hint then Duel.Hint(HINT_SELECTMSG, picker, hint) end
			local selected = candidates:Select(picker, minimum, 1, nil)
			local card = selected:GetFirst()
			if not card then break end
			Duel.HintSelection(selected, true)
			modify(context.card, card, EFFECT_UPDATE_ATTACK, amount, action.duration)
			picked[#picked + 1] = card
		end
		return remember(context, picked)
	elseif op == "PLAY_FROM_DECK" then
		return action_play_from_deck(action, context)
	elseif op == "LOOK_DECK_TOP" then
		local count = math.min(action.count or 1, Duel.GetFieldGroupCount(player, LOCATION_DECK, 0))
		if count > 0 then
			Duel.ConfirmCards(chooser, Duel.GetDecktopGroup(player, count))
		end
		context.last_action_succeeded = count > 0
		return {}
	elseif op == "DRAW_TO_HAND_COUNT" then
		local need = math.max(0, (action.count or 0) - Duel.GetFieldGroupCount(player, LOCATION_HAND, 0))
		context.last_action_succeeded = need == 0 or Duel.Draw(player, need, REASON_EFFECT) == need
		return {}
	elseif op == "TRASH_HAND_TO_COUNT" then
		local hand = Duel.GetFieldGroupCount(player, LOCATION_HAND, 0)
		local count = math.max(0, hand - (action.count or 0))
		local cards = select_zone(player, LOCATION_HAND, action.filter, count, count, player, context)
		if #cards > 0 then trash(cards, REASON_EFFECT + REASON_DISCARD) end
		emit_hand_discard(cards, context, player)
		context.last_action_succeeded = true
		return remember(context, cards)
	elseif op == "REDRAW_HAND" then
		local cards = from_group(Duel.GetFieldGroup(player, LOCATION_HAND, 0))
		local count = action.draw_same_count and #cards or (action.draw_count or #cards)
		if #cards > 0 then Duel.SendtoDeck(to_group(cards), player, SEQ_DECKBOTTOM, REASON_EFFECT) end
		Duel.ShuffleDeck(player)
		if count > 0 then Duel.Draw(player, count, REASON_RULE) end
		context.last_action_succeeded = true
		return cards
	elseif op == "DEAL_DAMAGE" then
		local result = opcg.life.damage_leader(player, action.count or 1, {
			source=context.card, effect_player=chooser,
		})
		context.last_action_succeeded = result and result.processed ~= 0
		return {}
	elseif op == "DRAW_EVENT_COUNT" then
		local count = context.event_count
			or (context.event_cards and #context.event_cards)
			or (context.event_group and context.event_group:GetCount()) or 0
		context.last_action_succeeded = count == 0 or Duel.Draw(player, count, REASON_EFFECT) == count
		return {}
	elseif op == "TRASH_LIFE_UNTIL" then
		local cards = {}
		while opcg.LifeCount(player) > (action.count or 0) do
			local card = life_top(player)
			if not card then break end
			cards[#cards + 1] = card
			Duel.SendtoGrave(card, REASON_EFFECT)
		end
		if #cards > 0 and opcg.life and opcg.life.notify_decreased then
			opcg.life.notify_decreased(player, context, #cards)
		end
		context.last_action_succeeded = true
		return remember(context, cards)
	elseif op == "TRASH_FACEUP_LIFE_ALL" then
		local cards = {}
		for _, card in ipairs(life_cards(player)) do
			if card:IsPosition(POS_FACEUP) then cards[#cards + 1] = card end
		end
		if #cards > 0 then Duel.SendtoGrave(to_group(cards), REASON_EFFECT) end
		if #cards > 0 and opcg.life and opcg.life.notify_decreased then
			opcg.life.notify_decreased(player, context, #cards)
		end
		context.last_action_succeeded = true
		return remember(context, cards)
	elseif op == "SET_ALL_LIFE_FACE_DOWN" then
		local cards = life_cards(player)
		for _, card in ipairs(cards) do Duel.ChangePosition(card, POS_FACEDOWN_DEFENSE) end
		context.last_action_succeeded = true
		return remember(context, cards)
	elseif op == "LOOK_REORDER_LIFE_TOP" or op == "LOOK_REORDER_ALL_LIFE" then
		return action_life_reorder(action, context)
	elseif op == "REORDER_ALL_LIFE_RETURN_ONE_TO_DECK" then
		action_life_reorder({player=action.player}, context)
		local card = life_top(player)
		if not card then context.last_action_succeeded = false return {} end
		Duel.SendtoDeck(card, player, action.destination == "DECK_BOTTOM"
			and SEQ_DECKBOTTOM or SEQ_DECKTOP, REASON_EFFECT)
		if opcg.life and opcg.life.notify_decreased then
			opcg.life.notify_decreased(player, context, 1)
		end
		context.last_action_succeeded = true
		return remember(context, {card})
	elseif op == "ADD_LIFE_FROM_HAND_OR_TRASH" then
		local minimum = action.mode == "EXACT" and (action.count or 1) or 0
		local cards = select_zone(player, LOCATION_HAND + LOCATION_GRAVE, action.filter,
			minimum, action.count or 1, chooser, context)
		local added = {}
		for _, card in ipairs(cards) do
			if send_life(card, player, action.faceup == true, false) then added[#added + 1] = card end
		end
		return remember(context, added)
	elseif op == "DECLARE_COST_REVEAL" then
		local declared = Duel.AnnounceNumber and Duel.AnnounceNumber(player,
			0,1,2,3,4,5,6,7,8,9,10) or Duel.SelectOption(player, 0,1,2,3,4,5,6,7,8,9,10)
		local owner = action.reveal_player == "OPPONENT" and other(player) or player
		local top = Duel.GetDecktopGroup(owner, 1)
		if top:GetCount() == 0 then context.last_action_succeeded = false return {} end
		-- an actual 공개: BOTH players see the flipped card (deck-location
		-- ConfirmCards routes to a single player, use the public broadcast)
		if Duel.ConfirmDecktop then Duel.ConfirmDecktop(owner, 1)
		else Duel.ConfirmCards(player, top) Duel.ConfirmCards(other(player), top) end
		local card = top:GetFirst()
		local matched = opcg.GetCost(card) == declared
		if matched then execute_nested(action.on_match, context) end
		context.last_action_succeeded = matched
		return remember(context, {card})
	elseif op == "OPPONENT_CHOOSES" then
		local available = {}
		for index, option in ipairs(action.options or {}) do
			if conditions_match((action.option_conditions or {})[index], context) then
				available[#available + 1] = {index=index, actions=option}
			end
		end
		if #available == 0 then context.last_action_succeeded = false return {} end
		local selected = 1
		if #available > 1 then
			local descriptions = {}
			-- 옵션 라벨 = cdb str9+(등록 시 배정 슬롯; opcg_contract 참조)
			local sbase = action._string_base or 8
			for index, item in ipairs(available) do
				descriptions[index] = aux.Stringid(context.card:GetOriginalCode(), sbase + item.index - 1)
			end
			selected = Duel.SelectOption(player, table.unpack(descriptions)) + 1
		end
		execute_nested(available[selected].actions, context)
		context.last_action_succeeded = true
		return {}
	elseif op == "DISCARD_HAND_FOR_POWER" then
		return action_power_by_count(action, context, function(p, c)
			local group = Duel.GetMatchingGroup(filter_for(action.filter, context), p, LOCATION_HAND, 0, nil)
			return from_group(group:Select(c, 0, group:GetCount(), nil))
		end, "TRASH", function(cards, p)
			emit_hand_discard(cards, context, p)
		end)
	elseif op == "RETURN_TRASH_ANY_FOR_POWER" then
		return action_power_by_count(action, context, function(p, c)
			local group = Duel.GetMatchingGroup(filter_for(action.filter, context), p, LOCATION_GRAVE, 0, nil)
			return from_group(group:Select(c, 0, group:GetCount(), nil))
		end, "DECK_BOTTOM")
	elseif op == "RETURN_OWN_ANY_FOR_POWER" then
		return action_power_by_count(action, context, function(p, c)
			local predicate = filter_for(action.filter, context)
			local group = Duel.GetMatchingGroup(function(card)
				return opcg.IsCharacter(card) and predicate(card)
			end, p, LOCATION_MZONE, 0, nil)
			return from_group(group:Select(c, 0, group:GetCount(), nil))
		end, "HAND")
	elseif op == "REST_DON_FOR_POWER" then
		local count = opcg.ActiveDon(player)
		local wanted = count
		if count > 0 and Duel.AnnounceNumber then
			local choices = {} for i=0,count do choices[#choices+1]=i end
			wanted = Duel.AnnounceNumber(player, table.unpack(choices))
		end
		return action_power_by_count(action, context, function() local t={} for i=1,wanted do t[i]=true end return t end,
			"REST_DON")
	elseif op == "KO_OWN_ANY_FOR_POWER" then
		return action_power_by_count(action, context, function(p, c)
			local group = Duel.GetMatchingGroup(filter_for(action.filter, context), p, LOCATION_MZONE, 0, nil)
			return from_group(group:Select(c, 0, group:GetCount(), nil))
		end, "KO")
	elseif op == "REST_CARD_OR_DON" or op == "SET_ACTIVE_CARD_OR_DON" then
		local resting = op == "REST_CARD_OR_DON"
		-- [OPCG] "캐릭터 또는 두웅!! 합계 N장"(OP12-037류) 재설계(유저 제보
		-- "상대 둥이 선택 후보로 아예 안 뜸"): 종전엔 장수 문답 → 캐릭터만
		-- 선택 → 잔여를 둥 자동 처리라 둥을 직접 집을 수 없었다. 이제 캐릭터
		-- 후보와 코스트 에리어 둥을 **한 선택창에 같이** 올려 섞어 고르게
		-- 한다. 고른 둥은 낱장 상태 전환, 캐릭터는 기존 헬퍼. 동결(리프레시
		-- 액티브 금지)은 효과 경로를 막지 않는다(2026-08-12 유저 재정 - 집행은
		-- RefreshDon 한 곳). 카드 셀렉터가 없는 둥 전용 문형은 종전대로 자동
		-- 처리(전부 등가라 고르는 의미가 없다).
		if not action.card_selector then
			local amount = choose_number_up_to(chooser, action.count or 1, action.mode)
			local moved_don = 0
			if amount > 0 then
				if resting then moved_don = opcg.RestDon(player, amount)
				else moved_don = opcg.SetDonActive(player, amount) end
			end
			context.last_action_succeeded = moved_don > 0 or action.mode == "UP_TO"
			return {}
		end
		local pool = Group.CreateGroup()
		local chars = opcg.GetCandidateGroup and opcg.GetCandidateGroup(action.card_selector, context)
		if chars then pool:Merge(chars) end
		if opcg.DonStateGroup then
			pool:Merge(opcg.DonStateGroup(player, not resting))
		end
		local maximum = math.min(action.count or 1, pool:GetCount())
		local minimum = action.mode == "UP_TO" and 0 or maximum
		local picked = {}
		if maximum > 0 then
			local selected = pool:Select(chooser, minimum, maximum, nil)
			for card in aux.Next(selected) do picked[#picked + 1] = card end
		end
		local moved = 0
		for _, card in ipairs(picked) do
			if opcg.IsDon and opcg.IsDon(card) then
				if opcg.SetDonRestedCard(card, resting, player) then moved = moved + 1 end
			else
				if resting then opcg.SetRested(card, context) else opcg.SetActive(card, true) end
				moved = moved + 1
			end
		end
		context.last_action_succeeded = moved > 0 or action.mode == "UP_TO"
		return picked
	elseif op == "PLAY_DISTINCT_FROM_TRASH" then
		local group = Duel.GetMatchingGroup(filter_for(action.filter, context), player, LOCATION_GRAVE, 0, nil)
		local played, names = {}, {}
		for _ = 1, action.count or 1 do
			local candidates = group:Filter(function(card) return not names[opcg.GetName(card)] end, nil)
			if candidates:GetCount() == 0 then break end
			local card = candidates:Select(chooser, 0, 1, nil):GetFirst()
			if not card then break end
			group:RemoveCard(card)
			names[opcg.GetName(card)] = true
			if play(card, player, chooser, action.rested == true) then played[#played + 1] = card end
		end
		context.last_action_succeeded = #played > 0 or action.mode == "UP_TO"
		return remember(context, played)
	elseif op == "PLAY_TWO_FROM_TRASH_SPLIT_STATE" then
		local first = select_zone(player, LOCATION_GRAVE, action.first_filter, 0,
			action.first_count or 1, chooser, context)
		local played = {}
		for _, card in ipairs(first) do if play(card, player, chooser, false) then played[#played+1]=card end end
		local second = select_zone(player, LOCATION_GRAVE, action.second_filter, 0,
			action.second_count or 1, chooser, context)
		for _, card in ipairs(second) do if play(card, player, chooser, true) then played[#played+1]=card end end
		return remember(context, played)
	elseif op == "REVEAL_PLAY_SPLIT_FROM_HAND" then
		local cards = select_zone(player, LOCATION_HAND, action.filter, 0, action.count or 2, chooser, context)
		if #cards > 0 then Duel.ConfirmCards(other(player), to_group(cards)) end
		local played = {}
		for index, card in ipairs(cards) do
			local rested = index > (action.active_count or 1)
			if rested and action.rested_filter and not filter_for(action.rested_filter, context)(card) then rested = false end
			if play(card, player, chooser, rested) then played[#played+1]=card end
		end
		return remember(context, played)
	elseif op == "CHANGE_ATTACK_TARGET" then
		local cards = choose(action.selector, context)
		if cards[1] then
			-- 구 배틀 심의 유물(context.battle.target 필드 갱신 - 현행 live
			-- 구조체에 없는 옛 이름)이라 선택만 되고 실제 어택은 그대로였다
			-- (OP14-060 유저 제보 2026-07-27). 현행 배틀은 네이티브 코어 소관:
			-- 블록 처리(opcg_battle 353행)와 동일하게 코어의 대상 교체를
			-- 호출한다(두 번째 인자 true = 후보 재검사 생략 - OPCG 적법성은
			-- 셀렉터가 이미 판단). MSG_ATTACK 재발신으로 클라 어택선도 갱신.
			if Duel.GetAttacker and Duel.GetAttacker() then
				Duel.ChangeAttackTarget(cards[1], true)
			end
			context.battle_target = cards[1]
			if context.battle and context.battle.context then
				context.battle.context.battle_target = cards[1]
			end
			-- 【상대의 어택 시】(OP14-060 도플라밍고) 같은 엔진 트리거 컨텍스트엔
			-- battle 링크가 없다 → 진행 중인 배틀 상태에 직접 반영(2026-08-18 제보:
			-- 카운터 이벤트 자동 조준이 원 대상에 발리던 원인).
			local live = opcg.battle and opcg.battle._live
			if live and live.context and (not Duel.GetAttacker or live.attacker == Duel.GetAttacker()) then
				live.context.battle_target = cards[1]
			end
		end
		return cards
	elseif op == "RETURN_DON_TO_MATCH_OPPONENT" then
		local effect = Effect.CreateEffect(context.card)
		effect:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		effect:SetCode(EVENT_PHASE + PHASE_END)
		effect:SetCountLimit(1)
		effect:SetOperation(function()
			local difference = math.max(0, opcg.FieldDon(player) - opcg.FieldDon(other(player)))
			if difference > 0 then opcg.ReturnDon(player, difference, player, nil, difference) end
		end)
		effect:SetReset(RESET_PHASE + PHASE_END)
		Duel.RegisterEffect(effect, player)
		context.last_action_succeeded = true
		return {}
	elseif op == "CANNOT_DRAW" then
		player_effect(context.card, player, EFFECT_CANNOT_DRAW, 1, action.duration)
		context.last_action_succeeded = true
		return {}
	elseif op == "CANNOT_PLAY" then
		local predicate = filter_for(action.filter, context)
		player_effect(context.card, player, opcg.EFFECT_CANNOT_PLAY,
			cannot_play_value(action, context.card, predicate), action.duration)
		context.last_action_succeeded = true
		return {}
	elseif op == "CANNOT_SET_DON_ACTIVE" then
		if action.count then
			local group = opcg.GetFieldDonGroup(player, action.filter and action.filter.state)
			local maximum = math.min(action.count, group:GetCount())
			local minimum = action.mode == "EXACT" and maximum or 0
			local selected = maximum > 0 and group:Select(chooser, minimum, maximum, nil)
				or Group.CreateGroup()
			for card in aux.Next(selected) do
				freeze_don_flag(card, action.duration, context.card)
			end
		else
			player_effect(context.card, player, opcg.EFFECT_CANNOT_SET_DON_ACTIVE,
				function(_, _, activation_context)
					if action.source == "CHARACTER_EFFECT" then
						return activation_context ~= nil and activation_context.card ~= nil
							and opcg.IsCharacter(activation_context.card)
					end
					return true
				end, action.duration)
		end
		context.last_action_succeeded = true
		return {}
	elseif op == "CANNOT_TAKE_LIFE_TO_HAND" then
		player_effect(context.card, player, opcg.EFFECT_CANNOT_TAKE_LIFE,
			function(_, reason_player)
				if action.reason == "SELF_EFFECT" or action.source == "OWN_EFFECT" then
					return reason_player == player
				end
				return true
			end, action.duration)
		context.last_action_succeeded = true
		return {}
	elseif op == "PLAY_OWN_CHARACTERS_RESTED" then
		player_effect(context.card, player, opcg.EFFECT_PLAY_RESTED,
			function(_, card) return card ~= nil and opcg.IsCharacter(card) end, action.duration)
		context.last_action_succeeded = true
		return {}
	elseif op == "REQUIRE_HAND_DISCARD_TO_ATTACK" then
		local predicate = filter_for(action.attacker_filter, context)
		player_effect(context.card, player, opcg.EFFECT_REQUIRE_ATTACK_DISCARD,
			function(_, attacker)
				return attacker ~= nil and predicate(attacker), action.count or 1
			end, action.duration)
		context.last_action_succeeded = true
		return {}
	elseif op == "NEGATE_TIMING_EFFECTS" then
		player_effect(context.card, player, opcg.EFFECT_NEGATE_TIMING,
			function(_, timing, source)
				if timing ~= action.timing then return false end
				return action.scope ~= "SELF" or source == context.card
			end, action.duration)
		context.last_action_succeeded = true
		return {}
	elseif op == "CANNOT_SET_ACTIVE_CARD_OR_DON" then
		-- OP07-026 보니 수리(유저 제보 2026-08-09 "상대 둥 못 얼림"): 종전엔
		-- 캐릭터 창을 먼저 열고 그걸 취소해야만 둥 창이 뒤따르는 2단 흐름이라
		-- 상대 둥을 사실상 집을 수 없었다 — OP12-037류(REST_CARD_OR_DON)가
		-- 앓다 고친 그 병증의 잔존 사례. 같은 처방: 캐릭터 후보와 코스트
		-- 에리어 둥을 한 선택창에 섞어 올린다. 둥 풀은 GetFieldDonGroup(부여
		-- 둥 포함)이 아니라 DonStateGroup(코스트 에리어 한정) — 부여 둥은
		-- 리프레시에 액티브가 아니라 반납이라 "레스트 상태인 둥!!"이 아니다.
		-- 동결 집행 자체는 온전(SetActive/set_rested가 개별 효과 존중 확인).
		local pool = Group.CreateGroup()
		local chars = action.card_selector and opcg.GetCandidateGroup
			and opcg.GetCandidateGroup(action.card_selector, context)
		if chars then pool:Merge(chars) end
		if opcg.DonStateGroup then
			pool:Merge(opcg.DonStateGroup(player, (action.don_state or "RESTED") == "RESTED"))
		end
		local maximum = math.min(action.count or 1, pool:GetCount())
		local minimum = action.mode == "EXACT" and maximum or 0
		local cards = {}
		if maximum > 0 then
			local selected = pool:Select(chooser, minimum, maximum, nil)
			if selected:GetCount() > 0 then Duel.HintSelection(selected, true) end
			for card in aux.Next(selected) do
				if opcg.IsLeader(card) or opcg.IsCharacter(card) or opcg.IsStage(card) then
					single_effect(context.card, card, opcg.EFFECT_CANNOT_SET_ACTIVE, 1, action.duration)
				else
					freeze_don_flag(card, action.duration, context.card)
				end
				cards[#cards + 1] = card
			end
		end
		context.last_action_succeeded = #cards > 0 or action.mode == "UP_TO"
		return cards
	elseif op == "CANNOT_LEAVE_FIELD" or op == "REPLACE_KO"
		or op == "REPLACE_LEAVE_FIELD" or op == "REPLACE_REST" then
		local code = op == "CANNOT_LEAVE_FIELD" and opcg.EFFECT_CANNOT_LEAVE_FIELD
			or op == "REPLACE_KO" and opcg.EFFECT_REPLACE_KO
			or op == "REPLACE_LEAVE_FIELD" and opcg.EFFECT_REPLACE_LEAVE
			or opcg.EFFECT_REPLACE_REST
		return apply_selector_effect(action, context, code, action)
	elseif op == "REPLACE_LIFE_TO_HAND" then
		player_effect(context.card, player, opcg.EFFECT_REPLACE_LIFE_TO_HAND, action, action.duration)
		context.last_action_succeeded = true
		return {}
	elseif op == "MODIFY_HAND_COST" then
		player_effect(context.card, player, opcg.EFFECT_MODIFY_HAND_COST, action, action.duration)
		context.last_action_succeeded = true
		return {}
	elseif op == "DON_PHASE_ATTACH_TO_LEADER" then
		player_effect(context.card, player, opcg.EFFECT_DON_PHASE_ATTACH, action, action.duration)
		context.last_action_succeeded = true
		return {}
	elseif op == "WIN_GAME" then
		if action.condition and not OPCGCore.CheckCondition(action.condition.op, action.condition, context) then
			context.last_action_succeeded = false
			return {}
		end
		Duel.Win(player, REASON_EFFECT)
		context.last_action_succeeded = true
		return {}
	end
	return nil, "UNHANDLED_CONTRACT_ACTION"
end

local function source_range(card)
	return opcg.IsStage(card) and LOCATION_FZONE or LOCATION_MZONE
end
local function continuous_player_effect(card, action, code, value, condition)
	local player = opcg.ResolvePlayer(action.player or "YOU", {
		card=card, player=card:GetControler(),
	})
	local native = Effect.CreateEffect(card)
	native:SetType(EFFECT_TYPE_FIELD)
	native:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	native:SetCode(code)
	native:SetRange(source_range(card))
	native:SetTargetRange(player == card:GetControler() and 1 or 0,
		player == card:GetControler() and 0 or 1)
	native:SetCondition(condition)
	opcg.SetEffectValue(native, value)
	card:RegisterEffect(native)
	return true
end
local function continuous_card_effect(card, action, code, value, condition)
	local selector = action.selector or action.attacker_selector or {}
	local context = {card=card, player=card:GetControler()}
	local predicate = selector.kind == "SELF" and function(target) return target == card end
		or opcg.KindPredicate(selector.kind)
	local filter = filter_for(selector.filter, context)
	if not predicate then return false end
	local native = Effect.CreateEffect(card)
	native:SetCode(code)
	native:SetCondition(condition)
	opcg.SetEffectValue(native, value)
	if action.limit == "ONCE_PER_TURN" then native:SetCountLimit(1) end
	if selector.kind == "SELF" then
		native:SetType(EFFECT_TYPE_SINGLE)
		native:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
		native:SetRange(source_range(card))
	else
		native:SetType(EFFECT_TYPE_FIELD)
		native:SetRange(source_range(card))
		local location = selector.kind == "STAGE" and LOCATION_FZONE or LOCATION_MZONE
		if selector.owner == "OPPONENT" then native:SetTargetRange(0, location)
		elseif selector.owner == "ANY" then native:SetTargetRange(location, location)
		else native:SetTargetRange(location, 0) end
		native:SetTarget(function(_, target) return predicate(target) and filter(target) end)
	end
	card:RegisterEffect(native)
	return true
end
local register_native_replace -- defined after the replacement helpers below
local continuous_card_code = {
	CANNOT_ATTACK=EFFECT_CANNOT_ATTACK,
	ALLOW_ATTACK_ACTIVE_CHARACTER=opcg.EFFECT_ALLOW_ATTACK_ACTIVE_CHARACTER,
	ALLOW_ATTACK_CHARACTER=opcg.EFFECT_ALLOW_ATTACK_CHARACTER,
	CANNOT_ATTACK_LEADER=opcg.EFFECT_CANNOT_ATTACK_LEADER,
	CANNOT_ATTACK_TARGETS=EFFECT_CANNOT_SELECT_BATTLE_TARGET,
	CANNOT_SET_ACTIVE=opcg.EFFECT_CANNOT_SET_ACTIVE,
	CANNOT_BE_RESTED=opcg.EFFECT_CANNOT_BE_RESTED,
	PREVENT_BLOCKER_ACTIVATION=opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION,
	ADD_NAME_ALIAS=opcg.EFFECT_NAME_ALIAS,
	CANNOT_LEAVE_FIELD=opcg.EFFECT_CANNOT_LEAVE_FIELD,
	REPLACE_REST=opcg.EFFECT_REPLACE_REST,
}

function X.register_continuous(card, effect, action, condition)
	local op = action.op
	action._source_card = card
	action._effect_id = effect.effect_id
	action._once_per_turn = effect.once_per_turn == true
	if op == "CANNOT_BE_KO" then
		local code, value = ko_protection(action, {card=card, player=card:GetControler()})
		return continuous_card_effect(card, action, code, value, condition)
	end
	if op == "DEFER_DECKOUT_TO_TURN_END" then
		-- OP15-022 브룩 리더: 룰상 덱 0장이어도 즉시 패배하지 않고, 덱이
		-- 0장이 된 턴의 종료 시 패배한다. CANNOT_LOSE_DECK로 즉사를 막고,
		-- 턴 종료에 덱 0이면 상대 승리. 발화는 EVENT_TURN_END(엔드 페이즈가
		-- 다 끝난 턴 경계, 즉석 해결)여야 한다 — EVENT_PHASE+PHASE_END에
		-- 태우면 PhaseEvent 수집 루프가 소진 표식 없는 이 연속효과를 매
		-- 재시작마다 다시 주워 SELECT_CHAIN 무한 공회전(유저 리플레이
		-- 2026-07-29, 항복으로만 탈출 가능)에 빠진다.
		continuous_player_effect(card, action, EFFECT_CANNOT_LOSE_DECK, 1, condition)
		local lose = Effect.CreateEffect(card)
		lose:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		lose:SetCode(EVENT_TURN_END)
		lose:SetRange(source_range(card))
		lose:SetCondition(function()
			return (condition == nil or condition())
				and Duel.GetFieldGroupCount(card:GetControler(), LOCATION_DECK, 0) == 0
		end)
		lose:SetOperation(function()
			Duel.Win(1 - card:GetControler(), REASON_EFFECT)
		end)
		card:RegisterEffect(lose)
		return true
	end
	if op == "NATIVE_EFFECT" then
		-- 예비 함수 연속형: 네이티브 코드를 상주 효과로 직결(셀렉터 무지정=SELF)
		local code = opcg.ResolveNativeEffectCode(action.code)
		if not code then return false end
		local shaped = action
		if not action.selector then
			shaped = {}
			for key, value in pairs(action) do shaped[key] = value end
			shaped.selector = { kind = "SELF", count = 1, mode = "EXACT", owner = "YOU" }
		end
		return continuous_card_effect(card, shaped, code, action.value or 1, condition)
	end
	if op == "DON_DECK_SIZE" then
		-- 룰상 둥!! 덱 크기(에넬 6장): 리더 자신에 상주 등록, 값=크기.
		-- selector 무지정이 정본 IR - continuous_card_effect가 요구하는 SELF
		-- 셀렉터를 보충한다(빠뜨리면 predicate 부재로 등록 자체가 무산).
		local shaped = action
		if not action.selector then
			shaped = {}
			for key, value in pairs(action) do shaped[key] = value end
			shaped.selector = { kind = "SELF", count = 1, mode = "EXACT", owner = "YOU" }
		end
		return continuous_card_effect(card, shaped, opcg.EFFECT_DON_DECK_SIZE,
			action.count or opcg.DON_MAX, condition)
	end
	if op == "REPLACE_KO" or op == "REPLACE_LEAVE_FIELD" then
		-- these ride the core's REAL replacement machinery (see
		-- register_native_replace): every destroy/send path is intercepted
		-- at the core instead of only the removals routed through opcg lua
		return register_native_replace(card, action, condition,
			op == "REPLACE_KO" and { EFFECT_DESTROY_REPLACE }
			or { EFFECT_DESTROY_REPLACE, EFFECT_SEND_REPLACE })
	end
	if op == "CANNOT_ATTACK_TARGETS" and not action.selector and not action.attacker_selector then
		-- 오라형 "상대는 X 이외에 어택할 수 없다"(OP01-051 키드): 효과의 탑승자는
		-- 상대 어택커 전원(리더+캐릭터)이고, 값이 금지 대상 필터를 판정한다.
		-- 종전엔 selector 부재로 continuous_card_effect가 조용히 false를 뱉어
		-- 효과가 아예 등록되지 않았다(유저 제보: 두웅 부착 효과 무반응).
		local ctx = {card=card, player=card:GetControler()}
		local native = Effect.CreateEffect(card)
		native:SetCode(EFFECT_CANNOT_SELECT_BATTLE_TARGET)
		native:SetCondition(condition)
		opcg.SetEffectValue(native, restriction_value(action, ctx))
		native:SetType(EFFECT_TYPE_FIELD)
		native:SetRange(LOCATION_MZONE)
		local mine = action.attacker_player == "YOU"
		local both = action.attacker_player == "ANY"
		native:SetTargetRange((mine or both) and LOCATION_MZONE or 0,
			(both or not mine) and LOCATION_MZONE or 0)
		native:SetTarget(function(_, target)
			return opcg.IsLeader(target) or opcg.IsCharacter(target)
		end)
		card:RegisterEffect(native)
		return true
	end
	if op == "CANNOT_BE_RESTED" then
		-- 타깃형(execute_restriction)과 같은 reason 판별. 지속 전면형이면
		-- 어택 선언 불가(CANNOT_ATTACK)도 동반 상주 - 현행 지속형 2장
		-- (OP11-046/OP12-021)은 전부 OPPONENT_EFFECT라 동반 없음.
		local ctx = {card=card, player=card:GetControler()}
		local ok = continuous_card_effect(card, action,
			opcg.EFFECT_CANNOT_BE_RESTED, rest_block_value(action, ctx), condition)
		if ok and action.reason ~= "OPPONENT_EFFECT" then
			continuous_card_effect(card, action, EFFECT_CANNOT_ATTACK,
				restriction_value(action, ctx), condition)
		end
		return ok
	end
	local code = continuous_card_code[op]
	if code then
		local value = op == "ADD_NAME_ALIAS" and action.name
			or (op == "CANNOT_LEAVE_FIELD" or op == "REPLACE_REST") and action
			or restriction_value(action, {card=card, player=card:GetControler()})
		return continuous_card_effect(card, action, code, value, condition)
	end
	if op == "NEGATE_EFFECTS" then
		return continuous_card_effect(card, action, EFFECT_DISABLE, 1, condition)
			and continuous_card_effect(card, action, EFFECT_DISABLE_EFFECT, 1, condition)
	end
	if op == "SET_BASE_POWER" or op == "SET_POWER" or op == "SET_COST" then
		local stat_code = op == "SET_BASE_POWER" and EFFECT_SET_BASE_ATTACK
			or op == "SET_POWER" and EFFECT_SET_ATTACK_FINAL or EFFECT_CHANGE_LEVEL
		return continuous_card_effect(card, action, stat_code, action.value or 0, condition)
	end
	if op == "MODIFY_HAND_COST" or op == "MODIFY_NEXT_PLAY_COST" then
		local selector = action.selector or {}
		local combined = function()
			return condition() and conditions_match(action.conditions, {
				card=card, player=card:GetControler(),
			})
		end
		local amount = action.amount or 0
		-- 코스트 채널 이중 발신: EFFECT_UPDATE_LEVEL은 몬스터 프레임(캐릭터/
		-- 리더) 전용이다 — 비몬스터(이벤트/스테이지)는 코어 get_level이 효과
		-- 조회 전에 구조적으로 0을 반환(card.cpp:997)해 감소가 증발한다
		-- (OP15-021 자기감소, 크로커다일 880000190 이벤트 아우라). 그래서
		-- 전용 코드(EFFECT_MODIFY_HAND_COST)를 쌍둥이로 함께 상주시키고,
		-- opcg.GetCost의 비몬스터 폴백이 그 채널을 합산한다(몬스터는
		-- GetLevel이 이미 반영하므로 그쪽에서 이중 적용 없음).
		local function register_channel(code, value)
			local native = Effect.CreateEffect(card)
			native:SetCode(code)
			native:SetCondition(combined)
			native:SetValue(value)
			if selector.kind == "SELF" then
				native:SetType(EFFECT_TYPE_SINGLE)
				native:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
				native:SetRange(LOCATION_HAND)
			else
				local predicate = filter_for(action.filter, {card=card, player=card:GetControler()})
				native:SetType(EFFECT_TYPE_FIELD)
				native:SetRange(source_range(card))
				native:SetTargetRange(LOCATION_HAND, 0)
				native:SetTarget(function(_, target) return predicate(target) end)
			end
			card:RegisterEffect(native)
		end
		if amount < 0 then
			-- 마이너스 레벨 불허(유저 재정 2026-07-18) — opcg_core modify_stat과
			-- 동일한 소스 클램프(현재 코스트 밑으로 감소 불가, uint32 랩 방어).
			register_channel(EFFECT_UPDATE_LEVEL, function(e, c)
				local cur = c:GetLevel()
				if cur < 0 or cur >= 0x80000000 then cur = 0 end
				if cur + amount < 0 then return -cur end
				return amount
			end)
		else
			register_channel(EFFECT_UPDATE_LEVEL, amount)
		end
		register_channel(opcg.EFFECT_MODIFY_HAND_COST, amount)
		return true
	end
	if op == "REPLACE_LIFE_TO_HAND" then
		return continuous_player_effect(card, action, opcg.EFFECT_REPLACE_LIFE_TO_HAND,
			action, condition)
	end
	if op == "CANNOT_DRAW" then
		return continuous_player_effect(card, action, EFFECT_CANNOT_DRAW, 1, condition)
	end
	if op == "CANNOT_PLAY" then
		-- OP12-036 조로 수리(2026-08-07 유저 제보: 효과 등장이 그대로 통과):
		-- 종전 등록은 (1) 필드 상주 한정이라 zone=HAND("패의 이 카드는")가
		-- 죽어 있었고 (2) SELF 셀렉터 무시로 걸리면 자기 통제권 전체를 막을
		-- 뻔했으며 (3) reason=EFFECT 무시로 일반 등장까지 걸릴 뻔했다.
		-- 셋 다 DSL대로 존중한다. zone=HAND면 패 상주 효과로 직접 등록
		-- (continuous_player_effect는 필드 상주 고정).
		local context = {card=card, player=card:GetControler()}
		local predicate = filter_for(action.filter, context)
		local value = cannot_play_value(action, card, predicate)
		if action.zone == "HAND" then
			local player = opcg.ResolvePlayer(action.player or "YOU", context)
			local native = Effect.CreateEffect(card)
			native:SetType(EFFECT_TYPE_FIELD)
			native:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
			native:SetCode(opcg.EFFECT_CANNOT_PLAY)
			native:SetRange(LOCATION_HAND)
			native:SetTargetRange(player == card:GetControler() and 1 or 0,
				player == card:GetControler() and 0 or 1)
			native:SetCondition(condition)
			opcg.SetEffectValue(native, value)
			card:RegisterEffect(native)
			return true
		end
		return continuous_player_effect(card, action, opcg.EFFECT_CANNOT_PLAY, value, condition)
	end
	if op == "CANNOT_SET_DON_ACTIVE" then
		return continuous_player_effect(card, action, opcg.EFFECT_CANNOT_SET_DON_ACTIVE,
			function(_, state) return action.filter == nil or action.filter.state == nil
				or action.filter.state == state end, condition)
	end
	if op == "CANNOT_TAKE_LIFE_TO_HAND" then
		local player = opcg.ResolvePlayer(action.player or "YOU",
			{card=card, player=card:GetControler()})
		return continuous_player_effect(card, action, opcg.EFFECT_CANNOT_TAKE_LIFE,
			function(_, reason_player)
				return action.reason ~= "SELF_EFFECT" and action.source ~= "OWN_EFFECT"
					or reason_player == player
			end, condition)
	end
	if op == "NEGATE_TIMING_EFFECTS" then
		return continuous_player_effect(card, action, opcg.EFFECT_NEGATE_TIMING,
			function(_, timing, source)
				return timing == action.timing and (action.scope ~= "SELF" or source == card)
			end, condition)
	end
	if op == "PLAY_OWN_CHARACTERS_RESTED" then
		return continuous_player_effect(card, action, opcg.EFFECT_PLAY_RESTED,
			function(_, target) return target ~= nil and opcg.IsCharacter(target) end, condition)
	end
	if op == "REQUIRE_HAND_DISCARD_TO_ATTACK" then
		local predicate = filter_for(action.attacker_filter, {card=card, player=card:GetControler()})
		return continuous_player_effect(card, action, opcg.EFFECT_REQUIRE_ATTACK_DISCARD,
			function(_, attacker) return attacker ~= nil and predicate(attacker) end, condition)
	end
	if op == "DON_PHASE_ATTACH_TO_LEADER" then
		return continuous_player_effect(card, action, opcg.EFFECT_DON_PHASE_ATTACH, action, condition)
	end
	if op == "WIN_GAME" and action.replacement_for == "DECK_OUT" then
		continuous_player_effect(card, action, EFFECT_CANNOT_LOSE_DECK, 1, condition)
		local win = Effect.CreateEffect(card)
		win:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		win:SetCode(EVENT_ADJUST)
		win:SetRange(source_range(card))
		win:SetCondition(function()
			local context = {card=card, player=card:GetControler()}
			return condition() and (not action.condition
				or OPCGCore.CheckCondition(action.condition.op, action.condition, context))
		end)
		win:SetOperation(function() Duel.Win(card:GetControler(), REASON_EFFECT) end)
		card:RegisterEffect(win)
		return true
	end
	return false
end

local function copy_context(context, card)
	local out = {}
	for key, value in pairs(context or {}) do out[key] = value end
	out.card = card
	out.player = card:GetControler()
	out.event_target = card
	out.event_targets = {card}
	return out
end
local function reason_matches(action, card, reason, context, ko)
	local wanted = action.reason or "ANY"
	if wanted == "ANY" then return true end
	local destroyed = (reason & REASON_DESTROY) ~= 0
	local battle = (reason & REASON_BATTLE) ~= 0
	local effect = (reason & REASON_EFFECT) ~= 0
	-- 행위 주체: 명시 필드(reason_player/effect_player)는 소생·대체 같은 특수
	-- 흐름만 실어 주고, 일반 효과 해결 문맥은 .player(효과 시전자)와 .card(시전
	-- 카드)만 갖고 다닌다. 종전엔 명시 필드만 봐서 "상대의 효과로 필드를 벗어나지
	-- 않는다"류가 실전에서 한 번도 발동하지 못했다(OP13-089 오로성 가족 유저 제보).
	local actor = context and (context.reason_player or context.effect_player or context.player)
	local actor_card = context and (context.reason_card or context.card)
	local opponent = actor ~= nil and actor ~= card:GetControler()
	if wanted == "BATTLE" then return battle end
	if wanted == "EFFECT" then return effect end
	if wanted == "OPPONENT_EFFECT" then return effect and opponent end
	-- OP15-098 "상대에 의해 필드를 벗어날 경우": 상대의 배틀 KO(배틀 이탈은 항상
	-- 상대 어택 측) 또는 상대의 효과 - 자기 효과로 치운 경우는 제외.
	if wanted == "OPPONENT_ANY" then return battle or (effect and opponent) end
	if wanted == "KO_OR_OPPONENT_EFFECT" then return (ko and destroyed) or (effect and opponent) end
	if wanted == "OPPONENT_CHARACTER_EFFECT" then
		return effect and opponent and actor_card ~= nil and opcg.IsCharacter(actor_card)
	end
	return false
end
X._replacement_usage = X._replacement_usage or setmetatable({}, {__mode="k"})
local function replacement_key(action)
	return action._effect_id or tostring(action)
end
local function replacement_used(action, context)
	if not action._once_per_turn then return false end
	local source = action._source_card or context.card
	local usage = X._replacement_usage[source]
	local turn = Duel.GetTurnCount and Duel.GetTurnCount() or 0
	return usage ~= nil and usage[replacement_key(action)] == turn
end
local function mark_replacement_used(action, context)
	if not action._once_per_turn then return end
	local source = action._source_card or context.card
	local usage = X._replacement_usage[source] or {}
	usage[replacement_key(action)] = Duel.GetTurnCount and Duel.GetTurnCount() or 0
	X._replacement_usage[source] = usage
end
local function replacement_available(action, context)
	if replacement_used(action, context) then return false end
	for _, condition in ipairs(action.disabled_if or {}) do
		if OPCGCore.CheckCondition(condition.op, condition, context) then return false end
	end
	for _, cost in ipairs(action.replacement_costs or {}) do
		if not OPCGCore.CanPayCost(cost.op, cost, context) then return false end
	end
	return true
end
local function apply_replacement(action, context)
	-- str4 = 예/아니오 질문 라벨(str1은 인쇄체계 예약이라 사용 금지)
	if action.optional and Duel.SelectYesNo
		and not Duel.SelectYesNo(context.player, aux.Stringid(context.card:GetOriginalCode(), 3)) then
		return false
	end
	for _, cost in ipairs(action.replacement_costs or {}) do
		OPCGCore.PayCost(cost.op, cost, context)
	end
	execute_nested(action.replacement_actions, context)
	mark_replacement_used(action, context)
	return true
end
-- REPLACE_KO / REPLACE_LEAVE_FIELD on the core's REAL replacement machinery
-- (EFFECT_DESTROY_REPLACE / EFFECT_SEND_REPLACE + OperationReplace): every
-- destroy/send path is intercepted at the core — including ones that never
-- pass through opcg's lua helpers — and a saved card is a properly canceled
-- destroy. Protocol: CONDITION = eligibility (called with the event),
-- TARGET = the player's decision (one call, prompt included),
-- VALUE = per-card "is this one protected", OPERATION = pay + instead.
register_native_replace = function(card, action, condition, codes)
	local self_only = action.selector == nil or action.selector.kind == "SELF"
	local predicate = nil
	local selector_filter = nil
	if not self_only then
		predicate = opcg.KindPredicate(action.selector.kind)
		if not predicate then return false end
		if action.selector.filter then
			selector_filter = filter_for(action.selector.filter,
				{card=card, player=card:GetControler()})
			if not selector_filter then return false end
		end
	end
	local function protects(target)
		if not target or not opcg.IsOnField(target) then return false end
		if target:GetControler() ~= card:GetControler() then return false end
		if self_only then return target == card end
		if not predicate(target) then return false end
		if selector_filter and not selector_filter(target) then return false end
		return true
	end
	local function replace_context(target, r, rp)
		local context = copy_context({
			reason = r, reason_player = rp, effect_player = rp,
		}, card)
		context.event_target = target
		context.event_targets = { target }
		context.ko_target = target
		return context
	end
	local function eligible(eg, r, rp, ko_event)
		if not eg then return false end
		local found = nil
		for target in aux.Next(eg) do
			if protects(target) and reason_matches(action, target, r,
				{ reason_player = rp, effect_player = rp }, ko_event) then
				found = target
				break
			end
		end
		if not found then return false end
		return replacement_available(action, replace_context(found, r, rp)), found
	end
	for _, code in ipairs(codes) do
		local is_destroy_code = code == EFFECT_DESTROY_REPLACE
		-- 배틀 파괴 흐름에서 operation은 지연 실행(desrep_chain)이라 그 시점의
		-- eg는 이미 생존자가 소거된 빈 그룹 — 판정 단계에서 찾은 생존자를
		-- 여기 기억해 뒀다가 operation(도장·코스트 문맥)이 쓴다.
		local last_found = nil
		local native = Effect.CreateEffect(card)
		native:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		native:SetCode(code)
		native:SetRange(source_range(card))
		native:SetCondition(function(e, tp, eg, ep, ev, re, r, rp)
			-- a destroy funnels its cards through send_to as well: the
			-- DESTROY_REPLACE twin owns those, or we would intercept twice
			if not is_destroy_code and (r & REASON_DESTROY) ~= 0 then return false end
			if condition and not condition(e, tp, eg, ep, ev, re, r, rp) then return false end
			local ok, found = eligible(eg, r, rp, is_destroy_code)
			if ok then last_found = found end
			return ok
		end)
		native:SetTarget(function(e, tp, eg, ep, ev, re, r, rp, chk)
			-- chk==0 is the ACTION-FORBIDDEN eligibility probe the core runs
			-- from is_activateable; the real decision call arrives without it
			if chk == 0 then
				local ok, found = eligible(eg, r, rp, is_destroy_code)
				if ok then last_found = found end
				return ok
			end
			-- 「~할 수 있다」: the decision happens HERE (the operation only
			-- runs after the core has already canceled the removal)
			if Duel.SelectEffectYesNo then
				return Duel.SelectEffectYesNo(tp, card)
			end
			return Duel.SelectYesNo(tp, aux.Stringid(card:GetOriginalCode(), 3))
		end)
		native:SetValue(function(e, target) return protects(target) end)
		native:SetOperation(function(e, tp, eg, ep, ev, re, r, rp)
			local saved = nil
			for target in aux.Next(eg) do
				if protects(target) then saved = target break end
			end
			saved = saved or last_found
			local context = replace_context(saved or card, r, rp)
			for _, cost in ipairs(action.replacement_costs or {}) do
				OPCGCore.PayCost(cost.op, cost, context)
			end
			execute_nested(action.replacement_actions, context)
			mark_replacement_used(action, context)
			-- 배틀 파괴를 치환으로 살린 카드에 도장: opcg_battle ⑤의 ko= 예비
			-- 집행이 이 카드를 "네이티브가 놓친 몫"으로 오인해 재파괴하는 것을
			-- 막는다(블록 교체 배틀은 원타겟 대조 게이트를 통과해 버림 —
			-- EB03-001 유저 재제보 2026-07-27: 정면은 나았는데 블록이 그대로).
			-- 도장은 begin_battle마다 초기화되는 배틀 스코프.
			if saved and (r & REASON_BATTLE) ~= 0 then
				opcg._replace_saved = opcg._replace_saved or setmetatable({}, {__mode="k"})
				opcg._replace_saved[saved] = true
			end
		end)
		card:RegisterEffect(native)
	end
	return true
end
local function card_effect_values(card, code)
	local values = {}
	if not card or not card.GetCardEffect then return values end
	for _, effect in ipairs({card:GetCardEffect(code)}) do
		values[#values + 1] = opcg.GetEffectValue(effect)
	end
	return values
end
-- Like card_effect_values but keeps each effect's SOURCE card. A guard
-- replacement (Koshiro: rest ITSELF to save another SLASH character) is a
-- FIELD effect that lives on the source but is queried from the victim, so
-- its SELF-referencing cost/actions must resolve against the source, not the
-- victim. For self-replacements the source IS the victim, so nothing changes.
local function card_effect_entries(card, code)
	local entries = {}
	if not card or not card.GetCardEffect then return entries end
	for _, effect in ipairs({card:GetCardEffect(code)}) do
		entries[#entries + 1] = {
			value = opcg.GetEffectValue(effect),
			source = (effect.GetHandler and effect:GetHandler()) or card,
		}
	end
	return entries
end
function X.before_remove(cards, reason, destination, context)
	local kept = {}
	for _, card in ipairs(cards or {}) do
		local blocked = false
		for _, action in ipairs(card_effect_values(card, opcg.EFFECT_CANNOT_LEAVE_FIELD)) do
			if type(action) ~= "table" or reason_matches(action, card, reason, context, false) then
				blocked = true
				break
			end
		end
		-- REPLACE_KO / REPLACE_LEAVE_FIELD interception moved to the core's
		-- native replacement machinery (register_native_replace): this hook
		-- keeps only the hard CANNOT_LEAVE_FIELD block above.
		if not blocked then kept[#kept + 1] = card end
	end
	return kept
end
function X.before_rest(card, context)
	for _, entry in ipairs(card_effect_entries(card, opcg.EFFECT_REPLACE_REST)) do
		local action = entry.value
		local local_context = copy_context(context, entry.source)
		local_context.event_target = card
		local_context.event_targets = {card}
		if type(action) == "table" and reason_matches(action, card,
			(context and context.reason) or REASON_EFFECT, context, false)
			and replacement_available(action, local_context)
			and apply_replacement(action, local_context) then return false end
	end
	return true
end

local function field_cards(player)
	local group = Duel.GetMatchingGroup(function(card)
		return opcg.IsLeader(card) or opcg.IsCharacter(card) or opcg.IsStage(card)
	end, player, LOCATION_MZONE + LOCATION_FZONE, 0, nil)
	return from_group(group)
end
local function emit_candidates(player, cards)
	if cards then return cards end
	if player == nil then
		local candidates = field_cards(0)
		for _, card in ipairs(field_cards(1)) do candidates[#candidates + 1] = card end
		return candidates
	end
	return field_cards(player)
end
local function enqueue_emit(timing, context, player, cards, options)
	context = context or {}
	context.timing = timing
	local candidates = emit_candidates(player, cards)
	if #candidates == 0 then return {} end
	if opcg.effect_queue and opcg.effect_queue.enqueue_timing then
		return opcg.effect_queue.enqueue_timing(candidates, timing, context, options)
	end
	local results = {}
	for _, card in ipairs(candidates) do
		if OPCGCore and OPCGCore.DispatchTiming then
			results[#results + 1] = OPCGCore.DispatchTiming(card, timing, context)
		end
	end
	return results
end
local function append_all(out, items)
	for _, item in ipairs(items or {}) do out[#out + 1] = item end
	return out
end
function X.emit(timing, context, player, cards)
	context = context or {}
	context.timing = timing
	local candidates = emit_candidates(player, cards)
	if #candidates == 0 then return {} end
	local queue = opcg.effect_queue
	if queue and queue.resolve_timing then
		-- 집행은 코어 발동. 체인 중 파생 = CHAIN_END 수집, 배틀 파생 =
		-- 네이티브 배틀 창 수집(어택은 네이티브 - 특별취급 없음).
		-- direct는 드레인 내부와 무체인 평시 훅뿐.
		local draining = queue.is_draining and queue.is_draining()
		local in_chain = Duel.GetCurrentChain and Duel.GetCurrentChain() > 0
		local in_battle = Duel.GetAttacker and Duel.GetAttacker() ~= nil
		if (in_chain or in_battle) and not draining then
			return queue.resolve_timing(candidates, timing, context,
				{engine=true, fallback_direct=true})
		end
		return queue.resolve_timing(candidates, timing, context)
	end
	local results = {}
	for _, card in ipairs(candidates) do
		if OPCGCore and OPCGCore.DispatchTiming then
			results[#results + 1] = OPCGCore.DispatchTiming(card, timing, context)
		end
	end
	return results
end
function X.after_remove(cards, reason, destination, context)
	context = context or {}
	local effect = (reason & REASON_EFFECT) ~= 0
	local destroyed = (reason & REASON_DESTROY) ~= 0
	local source_player = context.reason_player or context.effect_player
		or (context.card and context.card:GetControler())
	for _, card in ipairs(cards or {}) do
		local owner = card:GetControler()
		local event = {}
		for key, value in pairs(context) do event[key] = value end
		event.event_target = card
		event.event_targets = {card}
		event.event_cards = {card}
		event.event_count = 1
		event.reason = reason
		event.reason_player = source_player
		if effect and opcg.IsCharacter(card) then
			X.emit("ON_OWN_CHARACTER_LEFT_BY_EFFECT", event, owner)
			if source_player ~= nil and source_player ~= owner then
				X.emit("ON_OWN_TRAIT_CHARACTER_LEFT_BY_OPPONENT_EFFECT", event, owner)
				X.emit("ON_OWN_TRAIT_CHARACTER_KO_OR_LEFT_BY_OPPONENT_EFFECT", event, owner)
				-- [2026-08-10 룰 재정] 무효된 채 KO되면 본인의 KO 계열 타이밍 봉인
				if destroyed and card:GetFlagEffect(opcg.FLAG_NEGATED_KO) == 0 then
					X.emit("ON_KO_BY_OPPONENT_EFFECT", event, owner, {card})
				end
			else
				X.emit("ON_OWN_TRAIT_CHARACTER_LEFT_BY_EFFECT", event, owner)
			end
			if destination == "HAND" and source_player ~= nil and source_player ~= owner then
				X.emit("ON_OPPONENT_CHARACTER_RETURNED_TO_HAND_BY_OWN_EFFECT",
					event, source_player)
			end
		end
		if destroyed and opcg.IsCharacter(card) then
			-- [OP16-100] 캐릭터 KO 턴 이력(전투/효과 불문): 소유자별 턴
			-- 도장 — CHARACTER_KOED_THIS_TURN 조건이 소비한다.
			local turn = Duel.GetTurnCount and Duel.GetTurnCount() or 0
			local log = opcg._koed_this_turn
			if not log or log.turn ~= turn then
				log = { turn = turn }
				opcg._koed_this_turn = log
			end
			log[owner] = true
		end
		if destroyed and opcg.IsCharacter(card) and opcg.GetBasePower(card) >= 6000 then
			X.emit("ON_DAMAGE_OR_HIGH_POWER_CHARACTER_KO", event, owner)
		end
		-- [2026-08-19 유저 제보 OP14-041 행콕: 마가렛이 효과로 KO돼도 E2 침묵]
		-- 원인 불문 KO 리스너(ON_ANY_CHARACTER_KO 양측 / ON_OPPONENT_CHARACTER_KO
		-- 상대측)는 배틀 KO만 opcg_battle이 디스패치하고 효과 KO는 아무도 안 쐈다.
		-- 실제로 트래시에 떨어진 캐릭터만(내성으로 잔존하면 제외), 배틀 KO는
		-- 배틀 쪽이 이미 쏘므로 제외. 【KO 시】 봉인 스탬프는 본인 타이밍 전용이라
		-- 타인 리스너엔 무관.
		if destroyed and opcg.IsCharacter(card) and (reason & REASON_BATTLE) == 0
			and card:IsLocation(LOCATION_GRAVE) and card:IsReason(REASON_DESTROY) then
			X.emit("ON_ANY_CHARACTER_KO", event, owner)
			X.emit("ON_ANY_CHARACTER_KO", event, other(owner))
			X.emit("ON_OPPONENT_CHARACTER_KO", event, other(owner))
		end
	end
end
local function played_context(card, player, context)
	local event = {}
	for key, value in pairs(context or {}) do event[key] = value end
	if event.card and event.card ~= card then event.source_card = event.card end
	event.played_card = card
	event.played_player = player
	event.event_target = card
	event.event_targets = {card}
	event.event_cards = {card}
	event.event_count = 1
	event.event_player = player
	return event
end

function X.emit_played(card, player, context)
	if not card then return {}, {} end
	player = player or card:GetControler()
	local event = played_context(card, player, context)
	local queue = opcg.effect_queue
	if queue and queue.enqueue_timing then
		-- 총합룰 8-6-3: a play that happens while another effect is resolving
		-- (battle dispatches, triggers) fires its timings right after that
		-- effect, BEFORE the next battle step. Nested direct items do exactly
		-- that; the engine path could only run at chain end, which inside the
		-- attack chain would wrongly be after the whole damage calculation.
		local nested = queue.is_draining and queue.is_draining() or false
		local emit_options = nested and {} or {engine=true}
		local enqueued = {}
		append_all(enqueued, enqueue_emit("ON_PLAY", event, player, {card},
			emit_options))
		if opcg.IsCharacter(card) then
			-- generic own-character-played listener (OP14-041 Hancock leader:
			-- "자신의 캐릭터가 등장했을 때") - turn/side gates live on the listener
			append_all(enqueued, enqueue_emit("ON_OWN_CHARACTER_PLAYED",
				event, player, nil, emit_options))
			append_all(enqueued, enqueue_emit("ON_OPPONENT_CHARACTER_PLAYED",
				event, other(player), nil, emit_options))
			if opcg.HasLifeTrigger(card) then
				append_all(enqueued, enqueue_emit("ON_OWN_TRIGGER_CHARACTER_PLAYED",
					event, player, nil, emit_options))
			end
			if opcg.IsVanilla(card) and card:IsPreviousLocation(LOCATION_HAND) then
				append_all(enqueued, enqueue_emit(
					"ON_OWN_VANILLA_CHARACTER_PLAYED_FROM_HAND",
					event, player, nil, emit_options))
			end
			if opcg.GetBaseCost(card) >= 8 then
				append_all(enqueued, enqueue_emit("ON_OPPONENT_HIGH_COST_OR_EFFECT_PLAY",
					event, other(player), nil, emit_options))
			end
		end
		if not nested and queue.flush then queue.flush() end
		return enqueued, {}
	end

	local results = {}
	append_all(results, X.emit("ON_PLAY", event, player, {card}))
	if opcg.IsCharacter(card) then
		append_all(results, X.emit("ON_OWN_CHARACTER_PLAYED", event, player))
		append_all(results, X.emit("ON_OPPONENT_CHARACTER_PLAYED", event, other(player)))
		if opcg.HasLifeTrigger(card) then append_all(results, X.emit("ON_OWN_TRIGGER_CHARACTER_PLAYED", event, player)) end
		if opcg.IsVanilla(card) and card:IsPreviousLocation(LOCATION_HAND) then
			append_all(results, X.emit("ON_OWN_VANILLA_CHARACTER_PLAYED_FROM_HAND", event, player))
		end
		if opcg.GetBaseCost(card) >= 8 then
			append_all(results, X.emit("ON_OPPONENT_HIGH_COST_OR_EFFECT_PLAY", event, other(player)))
		end
	end
	return results, {}
end
opcg.EmitPlayed = X.emit_played
function X.on_character_played(card, player, context) return X.emit_played(card, player, context) end

X._boundary_queue = X._boundary_queue or {}
function X.schedule(schedule, source, operation)
	assert(type(operation) == "function", "scheduled operation is required")
	if schedule == "THIS_BATTLE_END" then
		local list = X._boundary_queue.END_OF_BATTLE or {}
		list[#list + 1] = operation
		X._boundary_queue.END_OF_BATTLE = list
		return true
	end
	if schedule == "THIS_TURN_END" then
		local effect = Effect.CreateEffect(source)
		effect:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		effect:SetCode(EVENT_PHASE + PHASE_END)
		effect:SetCountLimit(1)
		effect:SetOperation(operation)
		effect:SetReset(RESET_PHASE + PHASE_END)
		Duel.RegisterEffect(effect, source:GetControler())
		return true
	end
	return false
end
function X.advance_boundary(boundary, context)
	local list = X._boundary_queue[boundary] or {}
	X._boundary_queue[boundary] = {}
	local executed = {}
	for index, operation in ipairs(list) do
		local ok, result = pcall(operation, context)
		executed[index] = {ok=ok, result=result}
	end
	return {executed=executed, expired={}}
end

function X.mark_source_draw(context)
	if not context.card then return end
	opcg._source_draw_usage = opcg._source_draw_usage or setmetatable({}, {__mode="k"})
	opcg._source_draw_usage[context.card] = {
		turn=Duel.GetTurnCount and Duel.GetTurnCount() or 0,
		effect_id=context.effect and context.effect.effect_id,
	}
end

return X

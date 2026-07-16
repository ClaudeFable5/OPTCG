-- Lua implementation of the OPCGCore bridge.
-- It deliberately fails closed when an operation, selector, duration, or timing
-- cannot be represented exactly with the currently exposed ocgcore primitives.
OPCGCore = OPCGCore or {}
local C = OPCGCore

local STRING_DECK_TOP = 1241
local STRING_DECK_BOTTOM = 1242

local CONDITION = {
	YOUR_TURN=true, OPPONENT_TURN=true,
	LIFE_LTE=true, LIFE_GTE=true, LIFE_EQ=true,
	HAND_LTE=true, HAND_GTE=true, DECK_LTE=true, DECK_GTE=true, DECK_EQ=true,
	TRASH_GTE=true, CHARACTER_EXISTS=true, CHARACTER_COUNT_GTE=true,
	CHARACTER_COUNT_LTE=true, CHARACTER_COUNT_LT=true,
	LEADER_HAS_TRAIT=true, LEADER_HAS_TRAIT_ANY=true, LEADER_TRAIT_CONTAINS=true,
	LEADER_NAME_IS=true, LEADER_NAME_IS_ANY=true, LEADER_IS_MULTICOLOR=true,
	LEADER_HAS_ATTRIBUTE=true, LEADER_HAS_COLOR=true, LEADER_STATE_IS=true,
	LEADER_POWER_LTE=true, LEADER_POWER_GTE=true,
	FIELD_DON_GTE=true, FIELD_DON_LTE=true, FIELD_DON_EQ=true, ANY_FIELD_DON_EQ=true,
	FIELD_DON_LTE_OPPONENT=true, FIELD_DON_LT_OPPONENT=true,
	FIELD_DON_BEHIND_BY_GTE=true, ACTIVE_DON_GTE=true, ACTIVE_DON_LTE=true,
	RESTED_DON_GTE=true, ALL_DON_RESTED=true, ATTACHED_DON_GTE=true,
	SELF_POWER_GTE=true, SELF_STATE_IS=true,
	LIFE_LT_OPPONENT=true, LIFE_LTE_OPPONENT=true, LIFE_TOTAL_LTE=true,
	LIFE_TOTAL_GTE=true, LIFE_HAND_TOTAL_LTE=true, HAND_BEHIND_BY_GTE=true,
	CHARACTER_COUNT_BEHIND_BY_GTE=true, LEADER_OR_CHARACTER_EXISTS=true,
	LAST_ACTION_SUCCEEDED=true, LAST_TARGET_MATCHES=true,
	ANY_LIFE_EQ=true, CHARACTER_NAME_ABSENT=true, OTHER_CHARACTER_NAME_ABSENT=true,
	ONLY_CHARACTERS_MATCH=true, RESTED_CARD_COUNT_GTE=true,
	OPPONENT_RESTED_CARD_COUNT_GTE=true, FACEUP_LIFE_EXISTS=true,
	FIELD_DON_EQ_OR_GTE=true, SELF_PLAYED_THIS_TURN=true,
	TRASH_CONTAINS_NAMES=true,
	BATTLE_ATTACKER_HAS_ATTRIBUTE=true, EVENT_CAUSED_BY_OWN_EFFECT=true,
	EVENT_SOURCE_TRAIT_CONTAINS=true,
	EVENT_COUNT_GTE=true, EVENT_DAMAGE_OR_TARGET_BASE_POWER_GTE=true,
	EVENT_TARGET_BASE_COST_GTE_OR_EFFECT_PLAY=true, EVENT_TARGET_BASE_COST_LTE=true,
	EVENT_TARGET_HAS_ATTRIBUTE=true, EVENT_TARGET_TRAIT_CONTAINS=true,
	LIFE_TRIGGER_ACTIVATED=true, SELF_BATTLED_OPPONENT_CHARACTER_THIS_TURN=true,
	SOURCE_EFFECT_DRAW_UNUSED_THIS_TURN=true,
	OWN_CHARACTERS_COST_SUM_GTE=true,
}
local COST = {
	TRASH_HAND=true, RETURN_DON=true, REST_SELF=true, REST_DON=true,
	TRASH_SELF=true, REST_OWN_CARD=true, RETURN_TRASH_TO_DECK_BOTTOM=true,
	RETURN_OWN_CARD_TO_HAND=true, RETURN_OWN_CARD_TO_DECK_BOTTOM=true,
	RETURN_SELF_TO_DECK_BOTTOM=true, TRASH_OWN_CARD=true, RETURN_SELF_TO_HAND=true,
	GIVE_DON=true, RETURN_HAND_TO_DECK=true, KO_OWN_CARD=true,
	RETURN_ATTACHED_DON=true, TAKE_LIFE_TO_HAND=true, TRASH_LIFE_TOP=true,
	FLIP_LIFE_TOP=true, MILL_DECK=true, REVEAL_HAND=true,
	MODIFY_OWN_POWER=true, ADD_OPPONENT_CARD_TO_LIFE=true,
	ADD_OWN_CARD_TO_LIFE=true, ALTERNATIVE_COST=true, PLAY_FROM_HAND=true,
	TRASH_CHARACTER_OR_HAND=true, TRASH_FIELD_OR_HAND=true,
}
local ACTION = {
	DRAW=true, TRASH_HAND=true, MODIFY_POWER=true, REST=true, SET_ACTIVE=true,
	KO=true, TRASH=true, RETURN_TO_HAND=true, RETURN_TO_DECK_BOTTOM=true,
	ADD_DON=true, GIVE_DON=true, SET_DON_ACTIVE=true, REST_DON=true,
	RETURN_DON=true, MILL_DECK=true, ADD_FROM_TRASH=true,
	RETURN_TRASH_TO_DECK_BOTTOM=true, PLAY_FROM_HAND=true, PLAY_FROM_TRASH=true,
	PLAY_SELF=true, SHUFFLE_DECK=true, ADD_SELF_TO_HAND=true, IF=true,
	TRANSFER_ATTACHED_DON=true, MODIFY_COST=true, MODIFY_COUNTER=true,
	GAIN_KEYWORD=true, SEARCH_DECK_TOP=true, PLAY_FROM_DECK_TOP=true,
	LOOK_REORDER_DECK_TOP=true, REVEAL_DECK_TOP=true, ADD_LIFE_FROM_DECK_TOP=true,
	ADD_LIFE_FROM_HAND=true, ADD_TO_LIFE=true, ADD_TO_OWNER_LIFE=true,
	RETURN_LIFE_TO_DECK=true, PLAY_FROM_HAND_OR_TRASH=true, PLAY_FROM_LIFE_TOP=true,
	REVEAL_HAND=true, TAKE_LIFE_TO_HAND=true, TRASH_LIFE_TOP=true, ACTIVATE_CARD_EFFECT=true,
	CHOOSE=true, RETURN_HAND_TO_DECK=true, REST_SELF=true, TRASH_SELF=true,
	RETURN_SELF_TO_HAND=true, RETURN_OWN_CARD_TO_DECK_BOTTOM=true,
	REST_OWN_CARD=true,
	CANNOT_BE_KO=true,
	MODIFY_POWER_PER_COUNT=true,
	MODIFY_COST_PER_COUNT=true,
	MODIFY_NEXT_PLAY_COST=true,
	ADD_LIFE_FROM_HAND_OR_TRASH=true, ADD_NAME_ALIAS=true,
	ALLOW_ATTACK_ACTIVE_CHARACTER=true, ALLOW_ATTACK_CHARACTER=true,
	CANNOT_ATTACK=true, CANNOT_ATTACK_LEADER=true, CANNOT_ATTACK_TARGETS=true,
	CANNOT_BE_RESTED=true, CANNOT_DRAW=true, CANNOT_LEAVE_FIELD=true,
	CANNOT_PLAY=true, CANNOT_SET_ACTIVE=true, CANNOT_SET_ACTIVE_CARD_OR_DON=true,
	CANNOT_SET_DON_ACTIVE=true, CANNOT_TAKE_LIFE_TO_HAND=true,
	CHANGE_ATTACK_TARGET=true, DEAL_DAMAGE=true, DECLARE_COST_REVEAL=true,
	DISCARD_HAND_FOR_POWER=true, DON_PHASE_ATTACH_TO_LEADER=true,
	DRAW_EVENT_COUNT=true, DRAW_TO_HAND_COUNT=true, KO_OWN_ANY_FOR_POWER=true,
	LOOK_DECK_TOP=true, LOOK_REORDER_ALL_LIFE=true, LOOK_REORDER_LIFE_TOP=true,
	MODIFY_HAND_COST=true, MODIFY_POWER_SPLIT=true, NEGATE_EFFECTS=true,
	NEGATE_TIMING_EFFECTS=true, OPPONENT_CHOOSES=true,
	PLAY_DISTINCT_FROM_TRASH=true, PLAY_FROM_DECK=true, DECK_BUILD_RESTRICTION=true,
	PLAY_OWN_CHARACTERS_RESTED=true, PLAY_TWO_FROM_TRASH_SPLIT_STATE=true,
	PREVENT_BLOCKER_ACTIVATION=true, REDRAW_HAND=true,
	REORDER_ALL_LIFE_RETURN_ONE_TO_DECK=true, REPLACE_KO=true,
	REPLACE_LEAVE_FIELD=true, REPLACE_LIFE_TO_HAND=true, REPLACE_REST=true,
	REQUIRE_HAND_DISCARD_TO_ATTACK=true, REST_CARD_OR_DON=true,
	REST_DON_FOR_POWER=true, RETURN_DON_TO_MATCH_OPPONENT=true,
	RETURN_TRASH_ANY_FOR_POWER=true, RETURN_OWN_ANY_FOR_POWER=true, REVEAL_PLAY_SPLIT_FROM_HAND=true,
	SET_ACTIVE_CARD_OR_DON=true, SET_ALL_LIFE_FACE_DOWN=true,
	SET_BASE_POWER=true, SET_BASE_POWER_FROM_TARGET=true, SET_COST=true,
	SET_POWER=true, TRASH_FACEUP_LIFE_ALL=true, TRASH_HAND_TO_COUNT=true,
	TRASH_LIFE_UNTIL=true, WIN_GAME=true,
}
local NATIVE_TIMING = {
	CONTINUOUS=true, CONTINUOUS_YOUR_TURN=true, CONTINUOUS_OPPONENT_TURN=true,
	RULE=true, GAME_START=true, ON_PLAY=true, ACTIVATE_MAIN=true, MAIN=true, YOUR_TURN_END=true,
	WHEN_ATTACKING=true, ON_OPPONENT_ATTACK=true, ON_KO=true,
	ON_BLOCK=true, ON_OPPONENT_BLOCKER_ACTIVATED=true, COUNTER=true,
	LIFE_TRIGGER=true, END_OF_BATTLE=true,
	WHEN_ATTACKING_OR_ATTACKED=true, WHEN_BATTLING=true,
	AFTER_BATTLE_WITH_OPPONENT_CHARACTER=true, ON_BATTLE_KO=true,
	ON_DAMAGE_TO_OPPONENT_LIFE=true, ON_ANY_CHARACTER_KO=true,
	ON_OPPONENT_CHARACTER_KO=true, ON_SELF_KO=true,
	ON_YOUR_LIFE_DECREASED=true, ON_OPPONENT_LIFE_DECREASED=true,
	ON_DAMAGE_OR_HIGH_POWER_CHARACTER_KO=true, ON_DON_ATTACHED_TO_OWN_FIELD=true,
	ON_DON_RETURNED=true, ON_DRAW_OUTSIDE_DRAW_PHASE=true,
	ON_HAND_DISCARDED_BY_TRAIT_EFFECT=true, ON_KO_BY_OPPONENT_EFFECT=true,
	ON_LIFE_ADDED_TO_HAND=true, ON_LIFE_TRIGGER_ACTIVATED=true,
	ON_OPPONENT_BLOCKER_OR_EVENT_ACTIVATED=true,
	ON_OPPONENT_CHARACTER_PLAYED=true,
	ON_OPPONENT_CHARACTER_RETURNED_TO_HAND_BY_OWN_EFFECT=true,
	ON_OPPONENT_EVENT_ACTIVATED=true, ON_OPPONENT_EVENT_OR_TRIGGER_ACTIVATED=true,
	ON_OPPONENT_HIGH_COST_OR_EFFECT_PLAY=true,
	ON_OWN_CHARACTER_LEFT_BY_EFFECT=true, ON_OWN_CHARACTER_RESTED_BY_EFFECT=true,
	ON_OWN_TRAIT_CHARACTER_KO_OR_LEFT_BY_OPPONENT_EFFECT=true,
	ON_OWN_TRAIT_CHARACTER_LEFT_BY_EFFECT=true,
	ON_OWN_TRAIT_CHARACTER_LEFT_BY_OPPONENT_EFFECT=true,
	ON_OWN_TRIGGER_CHARACTER_PLAYED=true, ON_OWN_VANILLA_CHARACTER_PLAYED_FROM_HAND=true,
	ON_SELF_RESTED_BY_OPPONENT_EFFECT=true, ON_YOUR_EVENT_ACTIVATED=true,
	WHEN_ATTACKING_OPPONENT_LEADER=true, YOUR_TURN_START=true,
}

local ENGINE_SEMANTIC_TIMING = {
	ON_PLAY=true,
	ON_OPPONENT_CHARACTER_PLAYED=true,
	ON_OWN_TRIGGER_CHARACTER_PLAYED=true,
	ON_OWN_VANILLA_CHARACTER_PLAYED_FROM_HAND=true,
	ON_OPPONENT_HIGH_COST_OR_EFFECT_PLAY=true,
}

-- emit 계열(자동효과) 타이밍: X.emit이 발화하는 전 종목. 카드마다 리졸버
-- (네이티브 TRIGGER, Q.EVENT_RESOLVE)를 등록해 두면, 비배틀 문맥의 emit이
-- engine 경로(RaiseSingleEvent)로 올라가 발동 판정/체인 연출/1링크 강제를
-- 전부 코어가 집행한다. 배틀/중첩 해결 문맥은 direct 큐(8-6 경계 배수) 유지.
local EMIT_ENGINE_TIMING = {
	ON_HAND_DISCARDED_BY_TRAIT_EFFECT=true, ON_DON_RETURNED=true,
	ON_DON_ATTACHED_TO_OWN_FIELD=true, ON_DRAW_OUTSIDE_DRAW_PHASE=true,
	ON_YOUR_LIFE_DECREASED=true, ON_OPPONENT_LIFE_DECREASED=true,
	ON_LIFE_ADDED_TO_HAND=true, ON_LIFE_TRIGGER_ACTIVATED=true,
	ON_YOUR_EVENT_ACTIVATED=true, ON_OPPONENT_EVENT_ACTIVATED=true,
	ON_OPPONENT_EVENT_OR_TRIGGER_ACTIVATED=true,
	ON_OPPONENT_BLOCKER_OR_EVENT_ACTIVATED=true,
	ON_DAMAGE_OR_HIGH_POWER_CHARACTER_KO=true,
	ON_SELF_RESTED_BY_OPPONENT_EFFECT=true, ON_OWN_CHARACTER_RESTED_BY_EFFECT=true,
	ON_OWN_CHARACTER_LEFT_BY_EFFECT=true, ON_OWN_TRAIT_CHARACTER_LEFT_BY_EFFECT=true,
	ON_OWN_TRAIT_CHARACTER_LEFT_BY_OPPONENT_EFFECT=true,
	ON_OWN_TRAIT_CHARACTER_KO_OR_LEFT_BY_OPPONENT_EFFECT=true,
	ON_KO_BY_OPPONENT_EFFECT=true,
	ON_OPPONENT_CHARACTER_RETURNED_TO_HAND_BY_OWN_EFFECT=true,
}

local function other(player) return 1 - player end
local function controller(context)
	if context.player ~= nil then return context.player end
	if context.card then return context.card:GetControler() end
	return Duel.GetTurnPlayer()
end
local function context_player(value, context)
	return opcg.ResolvePlayer(value or "YOU", context)
end
local function popcount(value)
	local n = 0
	while value > 0 do n = n + (value & 1); value = value >> 1 end
	return n
end
local function contains(values, wanted)
	for _, value in ipairs(values or {}) do if value == wanted then return true end end
	return false
end
local function array_group(cards)
	local group = Group.CreateGroup()
	for _, card in ipairs(cards or {}) do group:AddCard(card) end
	return group
end
local function array_first(cards) return cards and cards[1] or nil end
local function remember_targets(context, cards)
	context.last_targets = cards or {}
	context.last_target = array_first(cards)
	return cards or {}
end
local function filter_for(value, context)
	return opcg.CompileFilter(value or {}, context)
end
local function zone_group(player, location, filter, context)
	local predicate = filter_for(filter, context)
	if not predicate then return nil end
	return Duel.GetMatchingGroup(predicate, player, location, 0, nil)
end
local function select_zone(player, location, filter, minimum, maximum, chooser, context)
	local group = zone_group(player, location, filter, context)
	if not group then return nil, "UNSUPPORTED_FILTER" end
	if group:GetCount() < minimum then return nil, "NOT_ENOUGH_CARDS" end
	maximum = math.min(maximum, group:GetCount())
	if maximum == 0 then return {} end
	local selected = group:Select(chooser, minimum, maximum, nil)
	local cards = {}
	for card in aux.Next(selected) do cards[#cards + 1] = card end
	return cards
end
local function count_zone(player, location, filter, context)
	local group = zone_group(player, location, filter, context)
	return group and group:GetCount() or nil
end
local function selector_count(selector, context)
	if not selector then return nil end
	if selector.kind == "SELF" then return context.card and 1 or 0 end
	local group = opcg.GetCandidateGroup(selector, context)
	return group and group:GetCount() or nil
end
local function selector_minimum(selector)
	if not selector then return 0 end
	return selector.mode == "EXACT" and (selector.count or 1) or 0
end
local function selector_payable(selector, context)
	local available = selector_count(selector, context)
	return available ~= nil and available >= selector_minimum(selector)
end
local function selector_with_state(selector, state)
	selector = selector or {}
	local out = {}
	for key, value in pairs(selector) do out[key] = value end
	local filter = {}
	for key, value in pairs(selector.filter or {}) do filter[key] = value end
	if filter.state == nil then filter.state = state end
	out.filter = filter
	return out
end
local function remove_cards(cards, reason, destination)
	if opcg.contract_ops and opcg.contract_ops.before_remove then
		cards = opcg.contract_ops.before_remove(cards, reason, destination,
			opcg.contract_ops.current_context)
	end
	local group = array_group(cards)
	for _, card in ipairs(cards or {}) do
		if opcg.IsLeader(card) or opcg.IsCharacter(card) then opcg.ReturnAttachedDon(card) end
	end
	local moved
	if destination == "HAND" then moved = Duel.SendtoHand(group, nil, reason)
	elseif destination == "DECK_TOP" then moved = Duel.SendtoDeck(group, nil, SEQ_DECKTOP, reason)
	elseif destination == "DECK_BOTTOM" then moved = Duel.SendtoDeck(group, nil, SEQ_DECKBOTTOM, reason)
	elseif (reason & REASON_DESTROY) ~= 0 then
		-- a K.O. is a real destroy: immunity (INDESTRUCTABLE), EVENT_DESTROYED
		-- and the native replacement machinery all hang off Duel.Destroy —
		-- SendtoGrave used to bypass every one of them
		moved = Duel.Destroy(group, reason & ~REASON_DESTROY)
	else moved = Duel.SendtoGrave(group, reason) end
	if opcg.contract_ops and opcg.contract_ops.after_remove then
		opcg.contract_ops.after_remove(cards, reason, destination,
			opcg.contract_ops.current_context)
	end
	return moved
end
local function emit_played(card, player, context)
	if opcg.EmitPlayed then return opcg.EmitPlayed(card, player, context) end
	if opcg.contract_ops and opcg.contract_ops.on_character_played and opcg.IsCharacter(card) then
		return opcg.contract_ops.on_character_played(card, player, context)
	end
end
local function place_character_card(card, player, rested, context)
	-- [OPCG] 지속 '레스트로 등장'(EFFECT_PLAY_RESTED — 예: OP09-022 리무
	-- "자신의 캐릭터 카드는 레스트 상태로 등장한다")은 효과 등장에도 적용.
	-- contract_ops.play(일반 등장)와 동일한 강제 검사 — 이게 빠져 있어서
	-- 기동 메인 등 효과로 등장한 캐릭터만 액티브로 나오던 버그 (2026-07-14).
	local forced_rested = opcg.contract_ops and opcg.contract_ops.player_has
		and opcg.contract_ops.player_has(player, opcg.EFFECT_PLAY_RESTED, card, context)
	local position = (rested or forced_rested) and POS_FACEUP_DEFENSE or POS_FACEUP_ATTACK
	local ok = Duel.MoveToField(card, player, player, LOCATION_MZONE, position, true, 0x1f)
	if ok then emit_played(card, player, context) end
	return ok
end
local function place_stage_card(card, player, rested, context)
	local position = rested and POS_FACEUP_DEFENSE or POS_FACEUP_ATTACK
	local ok = Duel.MoveToField(card, player, player, LOCATION_FZONE, position, true)
	if ok then emit_played(card, player, context) end
	return ok
end
local function move_deck_group_to_bottom(group)
    -- SendtoDeck is a no-op for cards already in LOCATION_DECK. MoveSequence
    -- uses the deck-specific sequence convention (0 = top, 1 = bottom).
    local cards = {}
    for card in aux.Next(group) do cards[#cards + 1] = card end
    for _, card in ipairs(cards) do Duel.MoveSequence(card, SEQ_DECKBOTTOM) end
end
local function move_deck_group_to_top(group)
	local cards = {}
	for card in aux.Next(group) do cards[#cards + 1] = card end
	for _, card in ipairs(cards) do Duel.MoveSequence(card, SEQ_DECKTOP) end
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
local function deck_destination_flags(action)
	local top, bottom = false, false
	local function scan(values)
		for _, value in ipairs(values or {}) do
			top = top or value == "DECK_TOP" or value == "TOP"
			bottom = bottom or value == "DECK_BOTTOM" or value == "BOTTOM"
		end
	end
	scan(action.destinations)
	scan(action.positions)
	local single = action.destination or action.position
	top = top or single == "DECK_TOP" or single == "TOP"
	bottom = bottom or single == "DECK_BOTTOM" or single == "BOTTOM"
	return top, bottom
end
local function choose_deck_destination(action, chooser, confirm_group)
	local top, bottom = deck_destination_flags(action)
	if top and bottom and Duel.SelectOption then
		if confirm_group and Duel.ConfirmCards then
			Duel.ConfirmCards(chooser, confirm_group)
		end
		return Duel.SelectOption(chooser, STRING_DECK_TOP, STRING_DECK_BOTTOM) == 0
			and "DECK_TOP" or "DECK_BOTTOM"
	end
	if top and not bottom then return "DECK_TOP" end
	return "DECK_BOTTOM"
end
local function order_deck_group(group, destination, chooser, player, order)
	local count = group:GetCount()
	if count <= 0 then return end
	if destination == "DECK_TOP" then
		move_deck_group_to_top(group)
		if order == "CHOOSE" and count > 1 then Duel.SortDecktop(chooser, player, count) end
	else
		move_deck_group_to_bottom(group)
		if order == "CHOOSE" and count > 1 then Duel.SortDeckbottom(chooser, player, count) end
	end
end
local function remove_cards_to_chosen_deck(cards, reason, action, chooser, player)
	local count = #(cards or {})
	if count <= 0 then return end
	local destination = choose_deck_destination(action, chooser, array_group(cards))
	remove_cards(cards, reason, destination)
	if action.order == "CHOOSE" and count > 1 then
		if destination == "DECK_TOP" then Duel.SortDecktop(chooser, player, count)
		else Duel.SortDeckbottom(chooser, player, count) end
	end
end
local function choose_selector(selector, context)
	local cards, reason = opcg.SelectCards(selector, context)
	if cards == nil then error(reason or "selector failed") end
	return remember_targets(context, cards)
end
local function leader(player) return opcg.GetLeader(player) end
local function event_target(context)
	return context.event_target or context.target or context.last_target
		or context.battle_target or (context.battle and context.battle.target)
end
local function event_count(context)
	if type(context.event_count) == "number" then return context.event_count end
	local cards = context.event_cards or context.event_group
	if type(cards) == "table" then return #cards end
	if cards and cards.GetCount then return cards:GetCount() end
	return event_target(context) and 1 or 0
end
local function source_draw_unused(context)
	local card = context.card
	if not card then return false end
	local state = opcg._source_draw_usage and opcg._source_draw_usage[card]
	if not state then return true end
	local turn = Duel.GetTurnCount and Duel.GetTurnCount() or 0
	return state.turn ~= turn or state.effect_id ~= (context.effect and context.effect.effect_id)
end
local function character_count(player, condition, context)
	local predicate = filter_for(condition.filter or {}, context)
	if not predicate then return nil end
	return Duel.GetMatchingGroupCount(function(card)
		return opcg.IsCharacter(card)
			and (condition.state == nil or (condition.state == "ACTIVE" and opcg.IsActive(card))
				or (condition.state == "RESTED" and opcg.IsRested(card)))
			and predicate(card)
	end, player, LOCATION_MZONE, 0, nil)
end
local function comparison_count(condition, context)
	local op = condition.op
	local player = context_player(condition.player, context)
	if op == "LIFE_LTE" or op == "LIFE_GTE" or op == "LIFE_EQ" then
		return opcg.LifeCount(player)
	elseif op == "HAND_LTE" or op == "HAND_GTE" then
		return Duel.GetFieldGroupCount(player, LOCATION_HAND, 0)
	elseif op == "DECK_LTE" or op == "DECK_GTE" or op == "DECK_EQ" then
		return Duel.GetFieldGroupCount(player, LOCATION_DECK, 0)
	elseif op == "TRASH_GTE" then
		return count_zone(player, LOCATION_GRAVE, condition.filter, context)
	elseif op == "CHARACTER_COUNT_GTE" or op == "CHARACTER_COUNT_LTE" or op == "CHARACTER_COUNT_LT" then
		return character_count(player, condition, context)
	end
	return nil
end

function C.GetAttachedDon(card) return opcg.GetAttachedDon(card) end

function C.CheckCondition(op, condition, context)
	context = context or {}
	local player = context_player(condition.player, context)
	local n = condition.count or 0
	if op == "YOUR_TURN" then return Duel.GetTurnPlayer() == controller(context) end
	if op == "OPPONENT_TURN" then return Duel.GetTurnPlayer() ~= controller(context) end

	local value = comparison_count(condition, context)
	if value ~= nil then
		if op:sub(-3) == "LTE" then return value <= n end
		if op:sub(-3) == "GTE" then return value >= n end
		if op:sub(-2) == "LT" then return value < n end
		if op:sub(-2) == "EQ" then return value == n end
	end

	if op == "CHARACTER_EXISTS" then
		local count = character_count(player, condition, context)
		return count ~= nil and count > 0
	end
	if op == "LEADER_OR_CHARACTER_EXISTS" then
		local predicate = filter_for(condition.filter, context)
		if not predicate then return false end
		return Duel.GetMatchingGroupCount(function(card)
			return (opcg.IsLeader(card) or (not condition.leader_only and opcg.IsCharacter(card)))
				and predicate(card)
		end, player, LOCATION_MZONE, 0, nil) > 0
	end

	local lead = leader(player)
	if op == "LEADER_HAS_TRAIT" then return lead ~= nil and opcg.HasTrait(lead, condition.trait) end
	if op == "LEADER_TRAIT_CONTAINS" then return lead ~= nil and opcg.TraitContains(lead, condition.trait) end
	if op == "LEADER_HAS_TRAIT_ANY" then
		if not lead then return false end
		for _, trait in ipairs(condition.traits or {}) do if opcg.HasTrait(lead, trait) then return true end end
		for _, name in ipairs(condition.names or {}) do if opcg.GetName(lead) == name then return true end end
		return false
	end
	if op == "LEADER_NAME_IS" then return lead ~= nil and opcg.GetName(lead) == condition.name end
	if op == "LEADER_NAME_IS_ANY" then return lead ~= nil and contains(condition.names, opcg.GetName(lead)) end
	if op == "LEADER_IS_MULTICOLOR" then return lead ~= nil and popcount(opcg.GetColors(lead)) > 1 end
	if op == "LEADER_HAS_ATTRIBUTE" then return lead ~= nil and opcg.HasAttribute(lead, condition.attribute) end
	if op == "LEADER_HAS_COLOR" then return lead ~= nil and opcg.HasColor(lead, condition.color) end
	if op == "LEADER_STATE_IS" then
		return lead ~= nil and ((condition.state == "ACTIVE" and opcg.IsActive(lead))
			or (condition.state == "RESTED" and opcg.IsRested(lead)))
	end
	if op == "LEADER_POWER_LTE" then return lead ~= nil and opcg.GetPower(lead) <= (condition.amount or 0) end
	if op == "LEADER_POWER_GTE" then return lead ~= nil and opcg.GetPower(lead) >= (condition.amount or 0) end

	if op == "OWN_CHARACTERS_COST_SUM_GTE" then
		local total = 0
		for card in aux.Next(opcg.GetCharacters(player)) do total = total + opcg.GetCost(card) end
		return total >= n
	end
	local field_don = context.field_don_snapshot ~= nil and player == context.player
		and context.field_don_snapshot or opcg.FieldDon(player)
	if op == "FIELD_DON_GTE" then return field_don >= n end
	if op == "FIELD_DON_LTE" then return field_don <= n end
	if op == "FIELD_DON_EQ" then return field_don == n end
	if op == "ANY_FIELD_DON_EQ" then return opcg.FieldDon(0) == n or opcg.FieldDon(1) == n end
	if op == "FIELD_DON_LTE_OPPONENT" then return opcg.FieldDon(player) <= opcg.FieldDon(other(player)) end
	if op == "FIELD_DON_LT_OPPONENT" then return opcg.FieldDon(player) < opcg.FieldDon(other(player)) end
	if op == "FIELD_DON_BEHIND_BY_GTE" then return opcg.FieldDon(other(player)) - opcg.FieldDon(player) >= n end
	if op == "ACTIVE_DON_GTE" then return opcg.ActiveDon(player) >= n end
	if op == "ACTIVE_DON_LTE" then return opcg.ActiveDon(player) <= n end
	if op == "RESTED_DON_GTE" then return opcg.RestedDon(player) >= n end
	if op == "ALL_DON_RESTED" then return opcg.ActiveDon(player) == 0 and opcg.CostAreaDon(player) > 0 end
	-- "자신의 부여되어 있는 두웅!!(합계)": every DON given to the player's
	-- leader/characters counts. The old on-field branch counted only the
	-- card's OWN attachments — always zero at 등장 시, so the whole
	-- "if you have given DON!!" family never fired from the field. Per-card
	-- requirements (DON!!×N) ride effect.don_attached, not this op.
	if op == "ATTACHED_DON_GTE" then return opcg.AttachedDonCount(player) >= n end

	if op == "SELF_POWER_GTE" then return context.card ~= nil and opcg.GetPower(context.card) >= (condition.amount or 0) end
	if op == "SELF_STATE_IS" then
		return context.card ~= nil and ((condition.state == "ACTIVE" and opcg.IsActive(context.card))
			or (condition.state == "RESTED" and opcg.IsRested(context.card)))
	end
	if op == "LIFE_LT_OPPONENT" then return opcg.LifeCount(player) < opcg.LifeCount(other(player)) end
	if op == "LIFE_LTE_OPPONENT" then return opcg.LifeCount(player) <= opcg.LifeCount(other(player)) end
	if op == "LIFE_TOTAL_LTE" then return opcg.LifeCount(0) + opcg.LifeCount(1) <= n end
	if op == "LIFE_TOTAL_GTE" then return opcg.LifeCount(0) + opcg.LifeCount(1) >= n end
	if op == "LIFE_HAND_TOTAL_LTE" then
		return opcg.LifeCount(player) + Duel.GetFieldGroupCount(player, LOCATION_HAND, 0) <= n
	end
	if op == "HAND_BEHIND_BY_GTE" then
		return Duel.GetFieldGroupCount(other(player), LOCATION_HAND, 0)
			- Duel.GetFieldGroupCount(player, LOCATION_HAND, 0) >= n
	end
	if op == "CHARACTER_COUNT_BEHIND_BY_GTE" then
		return opcg.GetCharacters(other(player)):GetCount() - opcg.GetCharacters(player):GetCount() >= n
	end
	if op == "ANY_LIFE_EQ" then
		return opcg.LifeCount(0) == n or opcg.LifeCount(1) == n
	end
	if op == "CHARACTER_NAME_ABSENT" or op == "OTHER_CHARACTER_NAME_ABSENT" then
		return Duel.GetMatchingGroupCount(function(card)
			return opcg.IsCharacter(card)
				and (op ~= "OTHER_CHARACTER_NAME_ABSENT" or card ~= context.card)
				and opcg.GetName(card) == condition.name
		end, player, LOCATION_MZONE, 0, nil) == 0
	end
	if op == "ONLY_CHARACTERS_MATCH" then
		local characters = opcg.GetCharacters(player)
		local predicate = filter_for(condition.filter, context)
		return predicate ~= nil and characters:FilterCount(predicate, nil) == characters:GetCount()
	end
	if op == "RESTED_CARD_COUNT_GTE" or op == "OPPONENT_RESTED_CARD_COUNT_GTE" then
		local checked = op == "OPPONENT_RESTED_CARD_COUNT_GTE" and other(player) or player
		local rested = Duel.GetMatchingGroupCount(function(card)
			return (opcg.IsLeader(card) or opcg.IsCharacter(card) or opcg.IsStage(card))
				and opcg.IsRested(card)
		end, checked, LOCATION_MZONE + LOCATION_FZONE, 0, nil)
		return rested + opcg.RestedDon(checked) >= n
	end
	if op == "FACEUP_LIFE_EXISTS" then
		return Duel.GetMatchingGroupCount(function(card)
			return card:IsPosition(POS_FACEUP)
		end, player, LOCATION_EXTRA, 0, nil) > 0
	end
	if op == "FIELD_DON_EQ_OR_GTE" then
		local amount = opcg.FieldDon(player)
		return amount == (condition.eq or -1) or amount >= (condition.gte or math.huge)
	end
	if op == "SELF_PLAYED_THIS_TURN" then
		return context.card ~= nil and context.card:GetTurnID() == Duel.GetTurnCount()
	end
	if op == "TRASH_CONTAINS_NAMES" then
		local found = {}
		local trash = Duel.GetFieldGroup(player, LOCATION_GRAVE, 0)
		for card in aux.Next(trash) do found[opcg.GetName(card)] = true end
		for _, name in ipairs(condition.names or {}) do if not found[name] then return false end end
		return true
	end
	if op == "LAST_ACTION_SUCCEEDED" then return context.last_action_succeeded == true end
	if op == "LAST_TARGET_MATCHES" then
		local predicate = filter_for(condition.filter, context)
		return predicate ~= nil and context.last_target ~= nil and predicate(context.last_target)
	end
	local target = event_target(context)
	if op == "BATTLE_ATTACKER_HAS_ATTRIBUTE" then
		local attacker = context.battle_attacker or (context.battle and context.battle.attacker)
		return attacker ~= nil and opcg.HasAttribute(attacker, condition.attribute)
	end
	if op == "EVENT_CAUSED_BY_OWN_EFFECT" then
		local source_player = context.event_player or context.reason_player
			or context.effect_player or context.trigger_player
		return source_player ~= nil and source_player == player
	end
	if op == "EVENT_COUNT_GTE" then return event_count(context) >= n end
	if op == "EVENT_TARGET_BASE_COST_LTE" then
		return target ~= nil and opcg.GetBaseCost(target) <= n
	end
	if op == "EVENT_TARGET_BASE_COST_GTE_OR_EFFECT_PLAY" then
		return context.effect_play == true or context.event_is_effect_play == true
			or (target ~= nil and opcg.GetBaseCost(target) >= n)
	end
	if op == "EVENT_DAMAGE_OR_TARGET_BASE_POWER_GTE" then
		-- GTE(amount)는 'KO된 대상의 원래 파워' 분기에만 걸린다 (OP13-002 E2:
		-- "대미지를 받았을 때 또는 원래 파워 6000 이상이 KO"). 데미지 분기는
		-- 발생 여부만 본다 — 데미지 양(라이프 1~2)에 amount를 대면 영구 false.
		return (context.damage or context.event_damage or 0) > 0
			or (target ~= nil and opcg.GetBasePower(target) >= (condition.amount or 0))
	end
	if op == "EVENT_TARGET_HAS_ATTRIBUTE" then
		return target ~= nil and opcg.HasAttribute(target, condition.attribute)
	end
	if op == "EVENT_TARGET_TRAIT_CONTAINS" then
		return target ~= nil and opcg.TraitContains(target, condition.trait)
	end
	if op == "EVENT_SOURCE_TRAIT_CONTAINS" then
		-- "자신의 《특징》 카드의 효과로 ~했을 때" 필터: 사건을 일으킨 효과의
		-- 소스 카드(event.source_card)가 지정 특징을 갖고, owner 지정 시
		-- 리스너와의 소유 관계까지 일치해야 한다.
		local source = context.source_card
		if source == nil then return false end
		if condition.owner == "YOU" and source:GetControler() ~= player then return false end
		if condition.owner == "OPPONENT" and source:GetControler() == player then return false end
		return opcg.HasTrait(source, condition.trait or condition.value)
	end
	if op == "LIFE_TRIGGER_ACTIVATED" then
		return context.life_trigger_activated == true
			or (opcg._turn_state and opcg._turn_state.life_trigger_activated == true)
	end
	if op == "SELF_BATTLED_OPPONENT_CHARACTER_THIS_TURN" then
		local turn = Duel.GetTurnCount and Duel.GetTurnCount() or 0
		local state = opcg._battle_usage and context.card and opcg._battle_usage[context.card]
		return state ~= nil and state.turn == turn and state.opponent_character == true
	end
	if op == "SOURCE_EFFECT_DRAW_UNUSED_THIS_TURN" then return source_draw_unused(context) end
	return false
end

local function life_extreme(player, top)
	local cards = Duel.GetFieldGroup(player, LOCATION_EXTRA, 0)
	local chosen, sequence
	for card in aux.Next(cards) do
		local current = card:GetSequence()
		if chosen == nil or (top and current > sequence) or (not top and current < sequence) then
			chosen, sequence = card, current
		end
	end
	return chosen
end
local function choose_life(player, position, chooser)
	if position == "TOP" then return life_extreme(player, true) end
	if position == "BOTTOM" then return life_extreme(player, false) end
	if position == "TOP_OR_BOTTOM" then
		local top, bottom = life_extreme(player, true), life_extreme(player, false)
		if not top then return nil end
		if top == bottom then return top end
		return Duel.SelectOption(chooser, aux.Stringid(879999998, 7), aux.Stringid(879999998, 8)) == 0 and top or bottom
	end
	return nil
end
local function life_count(player)
	return Duel.GetFieldGroupCount(player, LOCATION_EXTRA, 0)
end
-- FLIP_LIFE_TOP support. Flipping keeps a life card at its sequence, so
-- "위에서 N장" is the fixed top slice of the stack, not N repeated top picks.
local function life_from_top(player)
	local stack = {}
	for card in aux.Next(Duel.GetFieldGroup(player, LOCATION_EXTRA, 0)) do stack[#stack + 1] = card end
	table.sort(stack, function(left, right) return left:GetSequence() > right:GetSequence() end)
	return stack
end
local function faceup_life_group(player)
	return Duel.GetFieldGroup(player, LOCATION_EXTRA, 0):Filter(Card.IsPosition, nil, POS_FACEUP)
end
-- The exact cards a FLIP_LIFE_TOP would turn over, or nil while unpayable:
-- every card in the slice must still show the face the flip starts from.
local function life_flip_slice(player, cost, n)
	local stack = life_from_top(player)
	if cost.position == "BOTTOM" then
		local reversed = {}
		for index = #stack, 1, -1 do reversed[#reversed + 1] = stack[index] end
		stack = reversed
	end
	if #stack < n then return nil end
	local required = cost.faceup ~= false and POS_FACEDOWN or POS_FACEUP
	local slice = {}
	for index = 1, n do
		if not stack[index]:IsPosition(required) then return nil end
		slice[index] = stack[index]
	end
	return slice
end
local function flip_life(cards, faceup)
	local position = faceup and POS_FACEUP_DEFENSE or POS_FACEDOWN_DEFENSE
	local flipped = 0
	for _, card in ipairs(cards) do
		flipped = flipped + Duel.ChangePosition(card, position)
	end
	return flipped
end
local function reveal_cards_to(player, cards)
	for _, card in ipairs(cards or {}) do Duel.ConfirmCards(player, card) end
end

local function cost_player(context) return controller(context) end
local function cost_selector(cost)
	if cost.selector then return cost.selector end
	local filter = {}
	for key, value in pairs(cost.filter or {}) do filter[key] = value end
	if cost.op == "REST_OWN_CARD" then filter.state = "ACTIVE" end
	return { owner="YOU", kind="CHARACTER", count=cost.count or 1, mode="EXACT", filter=filter }
end
local function rest_own_group(cost, context)
	local player = cost_player(context)
	local allowed = {}
	for _, kind in ipairs(cost.kinds or { "CHARACTER" }) do allowed[kind] = true end
	local predicate = filter_for(cost.filter, context)
	if not predicate then return nil end
	return Duel.GetMatchingGroup(function(card)
		return allowed[opcg.GetCardType(card)] == true and opcg.IsActive(card) and predicate(card)
	end, player, LOCATION_MZONE + LOCATION_FZONE, 0, nil)
end

local function mixed_cost_group(cost, context, characters_only)
	local player = cost_player(context)
	local field_filter = cost.character_filter or cost.field_filter or cost.filter
	local hand_filter = cost.hand_filter or cost.filter
	local field_predicate = filter_for(field_filter, context)
	local hand_predicate = filter_for(hand_filter, context)
	if not field_predicate or not hand_predicate then return nil end
	return Duel.GetMatchingGroup(function(card)
		if card:IsLocation(LOCATION_HAND) then return hand_predicate(card) end
		if not opcg.IsOnField(card) then return false end
		if characters_only and not opcg.IsCharacter(card) then return false end
		return field_predicate(card)
	end, player, LOCATION_HAND + LOCATION_MZONE + LOCATION_FZONE, 0, nil)
end
local function alternative_payable(option, context)
	for _, nested in ipairs(option or {}) do
		if not C.CanPayCost(nested.op, nested, context) then return false end
	end
	return true
end
local function cost_life_position(cost, chooser)
	local top, bottom = false, false
	for _, value in ipairs(cost.positions or {}) do
		top = top or value == "TOP" or value == "LIFE_TOP"
		bottom = bottom or value == "BOTTOM" or value == "LIFE_BOTTOM"
	end
	top = top or cost.position == "TOP" or cost.position == "LIFE_TOP"
	bottom = bottom or cost.position == "BOTTOM" or cost.position == "LIFE_BOTTOM"
	if top and bottom then return Duel.SelectOption(chooser, aux.Stringid(879999998, 7), aux.Stringid(879999998, 8)) == 0 and "TOP" or "BOTTOM" end
	return bottom and "BOTTOM" or "TOP"
end
local function pay_card_to_life(card, player, position, faceup)
	local pos = faceup and POS_FACEUP_DEFENSE or POS_FACEDOWN_DEFENSE
	local moved = Duel.Sendto(card, LOCATION_EXTRA, REASON_COST, pos, player, 0)
	if moved and moved ~= 0 and position == "BOTTOM" and card:IsLocation(LOCATION_EXTRA) then
		Duel.MoveSequence(card, 0)
	end
	return moved and moved ~= 0
end

function C.CanPayCost(op, cost, context)
	context = context or {}
	local player = cost_player(context)
	local n = cost.count or cost.min_count or 1
	if op == "TRASH_HAND" then
		local available = count_zone(player, LOCATION_HAND, cost.filter, context)
		return available ~= nil and available >= n
	end
	if op == "REST_DON" then return opcg.ActiveDon(player) >= n end
	if op == "RETURN_DON" then return opcg.GetFieldDonGroup(player, cost.state):GetCount() >= n end
	if op == "REST_SELF" then return context.card ~= nil and opcg.IsOnField(context.card) and opcg.IsActive(context.card) end
	if op == "TRASH_SELF" or op == "RETURN_SELF_TO_DECK_BOTTOM" or op == "RETURN_SELF_TO_HAND" then
		return context.card ~= nil and opcg.IsOnField(context.card)
	end
	if op == "REST_OWN_CARD" then
		local group = rest_own_group(cost, context)
		return group ~= nil and group:GetCount() >= n
	end
	if op == "RETURN_OWN_CARD_TO_HAND" or op == "RETURN_OWN_CARD_TO_DECK_BOTTOM" or op == "TRASH_OWN_CARD"
		or op == "KO_OWN_CARD" then return selector_payable(cost_selector(cost), context) end
	if op == "RETURN_TRASH_TO_DECK_BOTTOM" then
		local available = count_zone(player, LOCATION_GRAVE, cost.filter, context)
		return available ~= nil and available >= n
	end
	if op == "GIVE_DON" then
		local available = cost.state == "ACTIVE" and opcg.ActiveDon(player)
			or cost.state == "RESTED" and opcg.RestedDon(player) or opcg.CostAreaDon(player)
		return available >= n and selector_payable(cost.selector, context)
	end
	if op == "RETURN_HAND_TO_DECK" then
		local available = count_zone(player, LOCATION_HAND, cost.filter, context)
		return available ~= nil and available >= n
	end
	if op == "RETURN_ATTACHED_DON" then return opcg.GetAttachedDon(context.card) >= n end
	if op == "TAKE_LIFE_TO_HAND" or op == "TRASH_LIFE_TOP" then
		return life_count(player) >= n
	end
	if op == "FLIP_LIFE_TOP" then
		-- target="ANY_FACEUP": "자신의 앞면인 라이프 1장을" (e.g. ST13-009)
		if cost.target == "ANY_FACEUP" then return faceup_life_group(player):GetCount() >= n end
		return life_flip_slice(player, cost, n) ~= nil
	end
	if op == "MILL_DECK" then
		return cost.mode == "OPTIONAL" or Duel.GetFieldGroupCount(player, LOCATION_DECK, 0) >= n
	end
	if op == "REVEAL_HAND" then
		local available = count_zone(player, LOCATION_HAND, cost.filter, context)
		return available ~= nil and available >= n
	end
	if op == "MODIFY_OWN_POWER" then
		return selector_payable(cost.selector, context)
	end
	if op == "ADD_OPPONENT_CARD_TO_LIFE" or op == "ADD_OWN_CARD_TO_LIFE" then
		return selector_payable(cost.selector, context)
	end
	if op == "ALTERNATIVE_COST" then
		for _, option in ipairs(cost.options or {}) do
			if alternative_payable(option, context) then return true end
		end
		return false
	end
	if op == "PLAY_FROM_HAND" then
		local available = count_zone(player, LOCATION_HAND, cost.filter, context)
		if available == nil or available < n then return false end
		if cost.filter and cost.filter.card_type == "CHARACTER" then
			return opcg.GetCharacters(player):GetCount() < 5
		end
		return true
	end
	if op == "TRASH_CHARACTER_OR_HAND" or op == "TRASH_FIELD_OR_HAND" then
		local group = mixed_cost_group(cost, context, op == "TRASH_CHARACTER_OR_HAND")
		return group ~= nil and group:GetCount() >= n
	end
	return false
end

-- 코스트로 버린 패도 "카드의 효과로 버려졌을 때"(쿠잔 OP12-040류)를 울린다.
-- 지인 실전 재정 + 아키타입 설계 근거(청 쿠잔 = 해군 패 코스트를 드로로
-- 되돌려받는 리더)로 2026-07-16 확정. 발신 형태는 액션판 TRASH_HAND와 동일.
local function emit_cost_hand_discard(cards, context, player)
	if #(cards or {}) == 0 or not opcg.contract_ops then return end
	local event = {}
	for key, value in pairs(context or {}) do event[key] = value end
	event.event_cards = cards
	event.event_count = #cards
	event.event_player = player
	event.source_card = context and context.card or nil
	opcg.contract_ops.emit("ON_HAND_DISCARDED_BY_TRAIT_EFFECT", event, player)
end

function C.PayCost(op, cost, context)
	context = context or {}
	if opcg.contract_ops then opcg.contract_ops.current_context = context end
	local player = cost_player(context)
	local n = cost.count or cost.min_count or 1
	local cards = {}
	if op == "TRASH_HAND" then
		cards = assert(select_zone(player, LOCATION_HAND, cost.filter, n, n, player, context))
		remove_cards(cards, REASON_COST + REASON_DISCARD, "TRASH")
		emit_cost_hand_discard(cards, context, player)
	elseif op == "REST_DON" then
		assert(opcg.RestDon(player, n) == n, "REST_DON failed")
	elseif op == "RETURN_DON" then
		local maximum = cost.count or cost.max_count or n
		assert(opcg.ReturnDon(player, maximum, player, cost.state, n) >= n, "RETURN_DON failed")
	elseif op == "REST_SELF" then
		opcg.SetRested(context.card)
		cards = { context.card }
	elseif op == "TRASH_SELF" then
		cards = { context.card }
		remove_cards(cards, REASON_COST, "TRASH")
	elseif op == "RETURN_SELF_TO_HAND" then
		cards = { context.card }
		remove_cards(cards, REASON_COST, "HAND")
	elseif op == "RETURN_SELF_TO_DECK_BOTTOM" then
		cards = { context.card }
		remove_cards(cards, REASON_COST, "DECK_BOTTOM")
	elseif op == "REST_OWN_CARD" then
		local group = assert(rest_own_group(cost, context), "REST_OWN_CARD filter unsupported")
		local selected = group:Select(player, n, n, nil)
		cards = {}
		for card in aux.Next(selected) do cards[#cards + 1] = card end
		remember_targets(context, cards)
		for _, card in ipairs(cards) do assert(opcg.IsActive(card), "REST_OWN_CARD target is rested") opcg.SetRested(card) end
	elseif op == "RETURN_OWN_CARD_TO_HAND" then
		cards = choose_selector(cost_selector(cost), context)
		remove_cards(cards, REASON_COST, "HAND")
	elseif op == "RETURN_OWN_CARD_TO_DECK_BOTTOM" then
		cards = choose_selector(cost_selector(cost), context)
		remove_cards(cards, REASON_COST, "DECK_BOTTOM")
		if cost.order == "CHOOSE" and #cards > 1 then Duel.SortDeckbottom(player, player, #cards) end
	elseif op == "TRASH_OWN_CARD" or op == "KO_OWN_CARD" then
		cards = choose_selector(cost_selector(cost), context)
		remove_cards(cards, op == "KO_OWN_CARD" and (REASON_COST + REASON_DESTROY) or REASON_COST, "TRASH")
	elseif op == "RETURN_TRASH_TO_DECK_BOTTOM" then
		cards = assert(select_zone(player, LOCATION_GRAVE, cost.filter, n, n, player, context))
		remove_cards(cards, REASON_COST, "DECK_BOTTOM")
		if cost.order == "CHOOSE" and #cards > 1 then Duel.SortDeckbottom(player, player, #cards) end
		if cost.shuffle then Duel.ShuffleDeck(player) end
	elseif op == "GIVE_DON" then
		cards = choose_selector(cost.selector, context)
		assert(opcg.GiveDon(player, cards[1], n, cost.state) == n, "GIVE_DON failed")
	elseif op == "RETURN_HAND_TO_DECK" then
		cards = assert(select_zone(player, LOCATION_HAND, cost.filter, n, n, player, context))
		remove_cards_to_chosen_deck(cards, REASON_COST, cost, player, player)
	elseif op == "RETURN_ATTACHED_DON" then
		local maximum = cost.max_count or n
		assert(opcg.ReturnAttachedDonToCost(context.card, n, maximum, player, cost.state) >= n,
			"RETURN_ATTACHED_DON failed")
	elseif op == "TAKE_LIFE_TO_HAND" or op == "TRASH_LIFE_TOP" then
		for _ = 1, n do
			local card = assert(choose_life(player, cost.position or "TOP", player), "life is empty")
			cards[#cards + 1] = card
			if op == "TAKE_LIFE_TO_HAND" then
				Duel.SendtoHand(card, player, REASON_COST)
			else
				Duel.SendtoGrave(card, REASON_COST)
			end
		end
		-- 코스트로 줄어든 라이프도 "라이프가 줄어들었을 때"에 성립한다
		-- (수단 한정 문구가 없는 트리거 계열 - 880001552/880000711 등).
		if #cards > 0 and opcg.life and opcg.life.notify_decreased then
			opcg.life.notify_decreased(player, context, #cards)
		end
	elseif op == "FLIP_LIFE_TOP" then
		-- the core flips life in place and broadcasts MSG_POS_CHANGE, so a
		-- face-up flip is already the public reveal (no ConfirmCards hack)
		if cost.target == "ANY_FACEUP" then
			local group = faceup_life_group(player)
			assert(group:GetCount() >= n, "FLIP_LIFE_TOP: no face-up life")
			local selected = group:Select(player, n, n, nil)
			for card in aux.Next(selected) do cards[#cards + 1] = card end
		else
			cards = assert(life_flip_slice(player, cost, n), "FLIP_LIFE_TOP: top of life cannot be flipped")
		end
		assert(flip_life(cards, cost.faceup ~= false) == #cards, "FLIP_LIFE_TOP failed")
	elseif op == "MILL_DECK" then
		local available = Duel.GetFieldGroupCount(player, LOCATION_DECK, 0)
		local amount = math.min(n, available)
		if cost.mode == "OPTIONAL" and amount > 0 and not Duel.SelectYesNo(player, 30) then amount = 0 end
		if amount > 0 then Duel.SendtoGrave(Duel.GetDecktopGroup(player, amount), REASON_COST) end
	elseif op == "REVEAL_HAND" then
		cards = assert(select_zone(player, LOCATION_HAND, cost.filter, n, n, player, context))
		reveal_cards_to(other(player), cards)
	elseif op == "MODIFY_OWN_POWER" then
		cards = choose_selector(cost.selector, context)
		for _, card in ipairs(cards) do
			local effect = Effect.CreateEffect(context.card)
			effect:SetType(EFFECT_TYPE_SINGLE)
			effect:SetCode(EFFECT_UPDATE_ATTACK)
			effect:SetValue(cost.amount or 0)
			effect:SetReset(RESET_PHASE + PHASE_END)
			card:RegisterEffect(effect)
		end
	elseif op == "ADD_OPPONENT_CARD_TO_LIFE" or op == "ADD_OWN_CARD_TO_LIFE" then
		cards = choose_selector(cost.selector, context)
		local destination = op == "ADD_OPPONENT_CARD_TO_LIFE" and other(player) or player
		for _, card in ipairs(cards) do
			assert(pay_card_to_life(card, destination,
				cost_life_position(cost, player), cost.faceup == true), op .. " failed")
		end
	elseif op == "ALTERNATIVE_COST" then
		local available = {}
		for _, option in ipairs(cost.options or {}) do
			if alternative_payable(option, context) then available[#available + 1] = option end
		end
		assert(#available > 0, "ALTERNATIVE_COST is not payable")
		local selected = 1
		if #available > 1 then
			local descriptions = {}
			local code = context.card:GetOriginalCode()
			for index = 1, #available do descriptions[index] = aux.Stringid(code, index - 1) end
			selected = Duel.SelectOption(player, table.unpack(descriptions)) + 1
		end
		for _, nested in ipairs(available[selected]) do C.PayCost(nested.op, nested, context) end
	elseif op == "PLAY_FROM_HAND" then
		cards = assert(select_zone(player, LOCATION_HAND, cost.filter, n, n, player, context))
		for _, card in ipairs(cards) do
			if opcg.IsCharacter(card) then
				assert(place_character_card(card, player, cost.rested == true, context), "PLAY_FROM_HAND failed")
			elseif opcg.IsStage(card) then
				assert(place_stage_card(card, player, cost.rested == true, context), "PLAY_FROM_HAND failed")
			else
				error("PLAY_FROM_HAND only supports CHARACTER or STAGE costs")
			end
		end
	elseif op == "TRASH_CHARACTER_OR_HAND" or op == "TRASH_FIELD_OR_HAND" then
		local group = assert(mixed_cost_group(cost, context, op == "TRASH_CHARACTER_OR_HAND"))
		local selected = group:Select(player, n, n, nil)
		local hand_cards = {}
		for card in aux.Next(selected) do
			cards[#cards + 1] = card
			if card:IsLocation(LOCATION_HAND) then hand_cards[#hand_cards + 1] = card end
		end
		remove_cards(cards, REASON_COST, "TRASH")
		emit_cost_hand_discard(hand_cards, context, player)
	else
		error("unsupported OPCG cost: " .. tostring(op))
	end
	return cards or {}
end

local function effect_reset(duration, source)
	-- battle durations really expire at the END_OF_BATTLE boundary (see
	-- modify_stat); PHASE_END is only the can't-leak-past-the-turn fallback
	if duration == "THIS_BATTLE" or duration == "END_OF_BATTLE" then return RESET_PHASE + PHASE_END end
	if duration == "THIS_TURN" or duration == nil then return RESET_PHASE + PHASE_END end
	local owner = source and source:GetControler() or Duel.GetTurnPlayer()
	local turn_player = Duel.GetTurnPlayer()
	if duration == "UNTIL_YOUR_NEXT_TURN_START" then
		return RESET_PHASE + PHASE_DRAW, turn_player == owner and 2 or 1
	end
	if duration == "UNTIL_YOUR_NEXT_TURN_END" then
		return RESET_PHASE + PHASE_END, turn_player == owner and 2 or 1
	end
	if duration == "UNTIL_OPPONENT_NEXT_TURN_END" then
		return RESET_PHASE + PHASE_END, turn_player ~= owner and 1 or 2
	end
	if duration == "UNTIL_YOUR_NEXT_REFRESH" or duration == "UNTIL_YOUR_NEXT_TURN_START" then
		return RESET_PHASE + PHASE_DRAW, turn_player == owner and 2 or 1
	end
	if duration == "UNTIL_OPPONENT_NEXT_REFRESH" then
		return RESET_PHASE + PHASE_DRAW, turn_player ~= owner and 1 or 2
	end
	return nil
end
local function modify_stat(source, target, code, amount, duration)
	local reset, reset_count = effect_reset(duration, source)
	if not reset then error("unsupported stat duration: " .. tostring(duration)) end
	local effect = Effect.CreateEffect(source)
	effect:SetType(EFFECT_TYPE_SINGLE)
	effect:SetCode(code)
	effect:SetValue(amount or 0)
	effect:SetReset(reset, reset_count or 1)
	target:RegisterEffect(effect)
	-- OPCG has no native damage phase, so battle-scoped durations expire at the
	-- battle machine's END_OF_BATTLE boundary (the native reset stays as a
	-- same-turn fallback).
	if (duration == "THIS_BATTLE" or duration == "END_OF_BATTLE")
		and opcg.contract_ops and opcg.contract_ops.schedule then
		opcg.contract_ops.schedule("THIS_BATTLE_END", source, function() effect:Reset() end)
	end
end
local function modify_power(source, target, amount, duration)
	return modify_stat(source, target, EFFECT_UPDATE_ATTACK, amount, duration)
end
local function modify_cost(source, target, amount, duration)
	return modify_stat(source, target, EFFECT_UPDATE_LEVEL, amount, duration)
end
local function modify_counter(source, target, amount, duration)
	return modify_stat(source, target, EFFECT_UPDATE_DEFENSE, amount, duration)
end
local function ensure_character_slot(player, chooser, context)
	local characters = opcg.GetCharacters(player)
	if characters:GetCount() < 5 then return true end
	local selected = characters:Select(chooser, 1, 1, nil)
	local card = selected:GetFirst()
	if not card then return false end
	remove_cards({ card }, REASON_RULE, "TRASH")
	return true
end
local function play_card(card, player, chooser, rested, context)
	if opcg.IsCharacter(card) then
		if not ensure_character_slot(player, chooser, context) then return false end
		return place_character_card(card, player, rested == true, context)
	end
	if opcg.IsStage(card) then
		local current = opcg.GetStage(player)
		if current then remove_cards({ current }, REASON_RULE, "TRASH") end
		return place_stage_card(card, player, rested == true, context)
	end
	return false
end
local function play_from_zone(action, location, context)
	local player = context_player(action.player, context)
	local chooser = controller(context)
	local minimum = action.mode == "EXACT" and (action.count or 1) or 0
	local maximum = action.count or 1
	local cards, reason = select_zone(player, location, action.filter, minimum, maximum, chooser, context)
	if cards == nil then error(reason) end
	local played = {}
	for _, card in ipairs(cards) do
		if play_card(card, player, chooser, action.rested == true, context) then played[#played + 1] = card end
	end
	return remember_targets(context, played)
end
local function search_deck_top(action, context)
	local player = context_player(action.player, context)
	local chooser = controller(context)
	local look_count = math.min(action.look_count or 1, Duel.GetFieldGroupCount(player, LOCATION_DECK, 0))
	local top = Duel.GetDecktopGroup(player, look_count)
	-- the LOOK is PRIVATE: the searcher browses every looked-at card, the
	-- opponent learns nothing (deck-location ConfirmCards routes to just the
	-- named player on both the client host and Multirole)
	if look_count > 0 then Duel.ConfirmCards(chooser, top) end
	local predicate = assert(filter_for(action.filter, context), "unsupported SEARCH_DECK_TOP filter")
	local candidates = top:Filter(predicate, nil)
	local maximum = math.min(action.select_count or 1, candidates:GetCount())
	local minimum = action.select_mode == "EXACT" and maximum or 0
	local selected = maximum > 0 and candidates:Select(chooser, minimum, maximum, nil) or Group.CreateGroup()
	local cards = {}
	for card in aux.Next(selected) do cards[#cards + 1] = card end
	top:Sub(selected)
	-- 공개: the PICKED cards are revealed to the opponent (the look itself
	-- stays private). Life additions skip this -- it would leak life info.
	if action.reveal ~= false and #cards > 0 and action.destination ~= "LIFE_TOP" then
		Duel.ConfirmCards(other(chooser), selected)
	end
	if action.destination == "HAND" then
		Duel.SendtoHand(selected, player, REASON_EFFECT)
	elseif action.destination == "TRASH" then
		Duel.SendtoGrave(selected, REASON_EFFECT)
	elseif action.destination == "LIFE_TOP" then
		for card in aux.Next(selected) do
			Duel.Sendto(card, LOCATION_EXTRA, REASON_EFFECT,
				action.faceup and POS_FACEUP_DEFENSE or POS_FACEDOWN_DEFENSE, player, 0)
		end
	else
		error("unsupported SEARCH_DECK_TOP destination")
	end
	if top:GetCount() > 0 then
		if action.rest_destinations then
			local destination = choose_deck_destination({destinations=action.rest_destinations}, chooser, top)
			order_deck_group(top, destination, chooser, player, action.rest_order)
		elseif action.rest_destination == "TRASH" then
			Duel.SendtoGrave(top, REASON_EFFECT)
		elseif action.rest_destination == "DECK_BOTTOM" then
			local count = top:GetCount()
			move_deck_group_to_bottom(top)
			if action.rest_order == "CHOOSE" and count > 1 then Duel.SortDeckbottom(chooser, player, count) end
		else
			error("unsupported SEARCH_DECK_TOP rest destination")
		end
	end
	return remember_targets(context, cards)
end
local function add_life_from_deck(action, context)
	if action.schedule then error("scheduled life addition is unsupported") end
	local player = context_player(action.player, context)
	local requested = action.count or 1
	local available = Duel.GetFieldGroupCount(player, LOCATION_DECK, 0)
	local amount = choose_number_up_to(controller(context), math.min(requested, available), action.mode)
	if action.mode == "EXACT" and amount < requested then return false end
	for _ = 1, amount do
		local top = Duel.GetDecktopGroup(player, 1)
		Duel.Sendto(top, LOCATION_EXTRA, REASON_EFFECT, POS_FACEDOWN_DEFENSE, player, 0)
	end
	return amount > 0 or action.mode == "UP_TO"
end
local function life_position(value)
	if value == "BOTTOM" or value == "LIFE_BOTTOM" then return "BOTTOM" end
	return "TOP"
end
local function choose_life_position(action, chooser)
	local top, bottom = false, false
	for _, position in ipairs(action.positions or {}) do
		local normalized = life_position(position)
		if normalized == "TOP" then top = true else bottom = true end
	end
	if action.position then
		local normalized = life_position(action.position)
		if normalized == "TOP" then top = true else bottom = true end
	end
	if top and bottom and Duel.SelectOption then
		return Duel.SelectOption(chooser, aux.Stringid(879999998, 7), aux.Stringid(879999998, 8)) == 0 and "TOP" or "BOTTOM"
	end
	return bottom and "BOTTOM" or "TOP"
end
local function send_to_life(card, player, position, faceup, reason)
	if not card then return false end
	local pos = faceup and POS_FACEUP_DEFENSE or POS_FACEDOWN_DEFENSE
	local moved = Duel.Sendto(card, LOCATION_EXTRA, reason or REASON_EFFECT, pos, player, 0)
	if moved and moved ~= 0 and life_position(position) == "BOTTOM" and card:IsLocation(LOCATION_EXTRA) then
		Duel.MoveSequence(card, 0)
	end
	return moved and moved ~= 0
end
local function play_from_deck_top(action, context)
	local player = context_player(action.player, context)
	local chooser = controller(context)
	local look_count = math.min(action.look_count or action.count or 1, Duel.GetFieldGroupCount(player, LOCATION_DECK, 0))
	local top = Duel.GetDecktopGroup(player, look_count)
	if look_count > 0 then
		-- private LOOK — ConfirmDecktop is the public excavate broadcast and
		-- would show the opponent every looked-at card
		Duel.ConfirmCards(chooser, top)
	end
	local predicate = assert(filter_for(action.filter, context), "unsupported PLAY_FROM_DECK_TOP filter")
	local candidates = top:Filter(predicate, nil)
	local maximum = math.min(action.select_count or action.count or 1, candidates:GetCount())
	local minimum = action.select_mode == "EXACT" and maximum or 0
	local selected = maximum > 0 and candidates:Select(chooser, minimum, maximum, nil) or Group.CreateGroup()
	local played = {}
	for card in aux.Next(selected) do
		if play_card(card, player, chooser, action.rested == true, context) then played[#played + 1] = card end
	end
	top:Sub(selected)
	if top:GetCount() > 0 then
		if action.rest_destinations then
			local destination = choose_deck_destination({destinations=action.rest_destinations}, chooser, top)
			order_deck_group(top, destination, chooser, player, action.rest_order)
		elseif action.rest_destination == "TRASH" then Duel.SendtoGrave(top, REASON_EFFECT)
		elseif action.rest_destination == "DECK_TOP" then
			-- unplayed cards never left the deck top; KEEP = leave them as-is
			if action.rest_order == "CHOOSE" and top:GetCount() > 1 then
				Duel.SortDecktop(chooser, player, top:GetCount())
			end
		else
			local count = top:GetCount()
			move_deck_group_to_bottom(top)
			if action.rest_order == "CHOOSE" and count > 1 then Duel.SortDeckbottom(chooser, player, count) end
		end
	end
	context.last_action_succeeded = #played > 0 or action.select_mode ~= "EXACT"
	return remember_targets(context, played)
end
local function look_reorder_deck_top(action, context)
	local player = context_player(action.player, context)
	local chooser = controller(context)
	local count = math.min(action.count or action.look_count or 1, Duel.GetFieldGroupCount(player, LOCATION_DECK, 0))
	if count <= 0 then context.last_action_succeeded = false return {} end
	local top = Duel.GetDecktopGroup(player, count)
	-- "look at" is PRIVATE to the controller: SortDeck*/SortDecktop already show
	-- the cards to the sorting player only. Do NOT ConfirmCards here -- that
	-- reveals them to the opponent too, which this effect must not do.
	local to_bottom, to_top = false, false
	for _, destination in ipairs(action.destinations or {}) do
		if destination == "DECK_BOTTOM" then to_bottom = true end
		if destination == "DECK_TOP" then to_top = true end
	end
	-- a single-card look never opens a sort dialog, so nothing would show the
	-- looker the card: confirm it privately (the both-destination path already
	-- confirms inside choose_deck_destination)
	if count == 1 and not (to_bottom and to_top) then
		Duel.ConfirmCards(chooser, top)
	end
	if to_bottom and to_top then
		-- The destination applies to the whole looked-at group; only its order is per card.
		local destination = choose_deck_destination(action, chooser, top)
		order_deck_group(top, destination, chooser, player, "CHOOSE")
	elseif to_bottom then
		move_deck_group_to_bottom(top)
		if count > 1 then Duel.SortDeckbottom(chooser, player, count) end
	elseif count > 1 then
		Duel.SortDecktop(chooser, player, count)
	end
	context.last_action_succeeded = true
	return {}
end
local function add_life_from_hand(action, context)
	local player = context_player(action.player, context)
	local chooser = controller(context)
	local minimum = action.mode == "EXACT" and (action.count or 1) or 0
	local maximum = action.count or 1
	local cards = assert(select_zone(player, LOCATION_HAND, action.filter, minimum, maximum, chooser, context))
	local added = {}
	for _, card in ipairs(cards) do
		if send_to_life(card, player, choose_life_position(action, chooser), action.faceup == true, REASON_EFFECT) then
			added[#added + 1] = card
		end
	end
	context.last_action_succeeded = #added > 0 or action.mode == "UP_TO"
	return remember_targets(context, added)
end
local function add_selected_to_life(action, context)
	local player = context_player(action.player, context)
	local chooser = controller(context)
	local cards = choose_selector(action.selector, context)
	local added = {}
	for _, card in ipairs(cards) do
		if send_to_life(card, player, choose_life_position(action, chooser), action.faceup == true, REASON_EFFECT) then
			added[#added + 1] = card
		end
	end
	context.last_action_succeeded = #added > 0 or (action.selector and action.selector.mode == "UP_TO")
	return remember_targets(context, added)
end
local function return_life_to_deck(action, context)
	local player = context_player(action.player, context)
	local chooser = controller(context)
	local cards = {}
	for _ = 1, action.count or 1 do
		local card = choose_life(player, action.position or "TOP", chooser)
		if not card then break end
		cards[#cards + 1] = card
		Duel.SendtoDeck(card, player, action.destination == "DECK_TOP" and SEQ_DECKTOP or SEQ_DECKBOTTOM, REASON_EFFECT)
	end
	context.last_action_succeeded = #cards > 0 or action.mode == "UP_TO"
	if #cards > 0 and opcg.life and opcg.life.notify_decreased then
		opcg.life.notify_decreased(player, context, #cards)
	end
	return remember_targets(context, cards)
end
local function play_from_life_top(action, context)
	local player = context_player(action.player, context)
	local chooser = controller(context)
	local card = choose_life(player, action.position or "TOP", chooser)
	if not card then context.last_action_succeeded = action.mode == "UP_TO" return {} end
	if action.reveal ~= false then
		local revealed = array_group({ card })
		Duel.ConfirmCards(chooser, revealed)
		Duel.ConfirmCards(other(chooser), revealed)
	end
	local predicate = assert(filter_for(action.filter, context), "unsupported PLAY_FROM_LIFE_TOP filter")
	if not predicate(card) then context.last_action_succeeded = action.mode == "UP_TO" return {} end
	if card:IsLocation(LOCATION_EXTRA) then
		Duel.Sendto(card, LOCATION_REMOVED, REASON_EFFECT, POS_FACEUP, player, 0)
	end
	local played = play_card(card, player, chooser, action.rested == true, context) and { card } or {}
	if #played == 0 and card:IsLocation(LOCATION_REMOVED) then
		Duel.Sendto(card, LOCATION_EXTRA, REASON_EFFECT, POS_FACEDOWN_DEFENSE, player, 0)
	end
	context.last_action_succeeded = #played > 0 or action.mode == "UP_TO"
	if #played > 0 and opcg.life and opcg.life.notify_decreased then
		opcg.life.notify_decreased(player, context, #played)
	end
	return remember_targets(context, played)
end
local function nested_conditions_match(conditions, context)
	for _, condition in ipairs(conditions or {}) do
		if not C.CheckCondition(condition.op, condition, context) then return false end
	end
	return true
end
local function execute_nested(actions, context)
	local out = {}
	local previous_action_succeeded = true
	for _, action in ipairs(actions or {}) do
		if action["then"] == true and previous_action_succeeded ~= true then
			context.last_action_succeeded = false
			out[#out + 1] = {}
		else
			-- IF/CHOOSE read the previous action's outcome in their own
			-- conditions - do not wipe it before they run (see runtime loop).
			if action.op ~= "IF" and action.op ~= "CHOOSE" then
				context.last_action_succeeded = nil
			end
			out[#out + 1] = C.ExecuteAction(action.op, action, context)
			if context.last_action_succeeded == nil then context.last_action_succeeded = true end
		end
		previous_action_succeeded = context.last_action_succeeded == true
	end
	return out
end

function C.ExecuteAction(op, action, context)
	context = context or {}
	if opcg.contract_ops then opcg.contract_ops.current_context = context end
	local player = context_player(action.player, context)
	local chooser = controller(context)
	local cards = {}
	if op == "DRAW" then
		local amount = choose_number_up_to(chooser, action.count or 1, action.mode)
		context.last_action_succeeded = amount == 0 and action.mode == "UP_TO"
			or Duel.Draw(player, amount, REASON_EFFECT) > 0
		if amount > 0 and context.last_action_succeeded and opcg.contract_ops
			and opcg.contract_ops.mark_source_draw then opcg.contract_ops.mark_source_draw(context) end
		if amount > 0 and context.last_action_succeeded and opcg.contract_ops
			and Duel.GetCurrentPhase and Duel.GetCurrentPhase() ~= PHASE_DRAW then
			local event = {}
			for key, value in pairs(context) do event[key] = value end
			event.event_count = amount
			event.event_player = player
			opcg.contract_ops.emit("ON_DRAW_OUTSIDE_DRAW_PHASE", event, player)
		end
		return {}
	elseif op == "TRASH_HAND" then
		local minimum = action.mode == "UP_TO" and 0 or math.min(action.count or 1,
			Duel.GetFieldGroupCount(player, LOCATION_HAND, 0))
		cards = assert(select_zone(player, LOCATION_HAND, action.filter, minimum, action.count or 1,
			action.chooser == "OPPONENT" and other(chooser) or player, context))
		remove_cards(cards, REASON_EFFECT + REASON_DISCARD, "TRASH")
		if #cards > 0 and opcg.contract_ops then
			local event = {}
			for key, value in pairs(context) do event[key] = value end
			event.event_cards = cards
			event.event_count = #cards
			event.event_player = player
			-- enqueue_timing overwrites event.card with the LISTENER card, so
			-- the discarding effect's source must ride a dedicated key for the
			-- trait/owner filter (EVENT_SOURCE_TRAIT_CONTAINS) to see it.
			event.source_card = context.card
			opcg.contract_ops.emit("ON_HAND_DISCARDED_BY_TRAIT_EFFECT", event, player)
		end
	elseif op == "REST_SELF" or op == "TRASH_SELF" or op == "RETURN_SELF_TO_HAND" then
		action = { selector={ owner="YOU", kind="SELF", count=1, mode="EXACT" } }
		op = op == "REST_SELF" and "REST" or op == "TRASH_SELF" and "TRASH" or "RETURN_TO_HAND"
		cards = choose_selector(action.selector, context)
	elseif op == "REST" or op == "SET_ACTIVE" or op == "KO" or op == "TRASH"
		or op == "RETURN_TO_HAND" or op == "RETURN_TO_DECK_BOTTOM" or op == "MODIFY_POWER"
		or op == "MODIFY_COST" or op == "MODIFY_COUNTER" or op == "GAIN_KEYWORD" then
		local selector = action.selector
		if op == "REST" then selector = selector_with_state(selector, "ACTIVE")
		elseif op == "SET_ACTIVE" then selector = selector_with_state(selector, "RESTED") end
		cards = choose_selector(selector, context)
		if op == "REST" then for _, card in ipairs(cards) do opcg.SetRested(card) end
		elseif op == "SET_ACTIVE" then for _, card in ipairs(cards) do opcg.SetActive(card) end
		elseif op == "KO" then remove_cards(cards, REASON_EFFECT + REASON_DESTROY, "TRASH")
		elseif op == "TRASH" then
			if action.schedule then
				assert(opcg.contract_ops.schedule(action.schedule, context.card,
					function() remove_cards(cards, REASON_EFFECT, "TRASH") end), "unsupported schedule")
			else
				remove_cards(cards, REASON_EFFECT, "TRASH")
			end
		elseif op == "RETURN_TO_HAND" then remove_cards(cards, REASON_EFFECT, "HAND")
		elseif op == "RETURN_TO_DECK_BOTTOM" then
			local operation = function()
				remove_cards(cards, REASON_EFFECT, "DECK_BOTTOM")
				if action.order == "CHOOSE" and #cards > 1 then Duel.SortDeckbottom(chooser, player, #cards) end
			end
			if action.schedule then
				assert(opcg.contract_ops.schedule(action.schedule, context.card, operation), "unsupported schedule")
			else operation() end
		elseif op == "MODIFY_POWER" then
			for _, card in ipairs(cards) do modify_power(context.card, card, action.amount, action.duration) end
		elseif op == "MODIFY_COST" then
			for _, card in ipairs(cards) do modify_cost(context.card, card, action.amount, action.duration) end
		elseif op == "MODIFY_COUNTER" then
			for _, card in ipairs(cards) do modify_counter(context.card, card, action.amount, action.duration) end
		else
			local reset, count = effect_reset(action.duration, context.card)
			for _, card in ipairs(cards) do assert(opcg.GrantKeyword(card, action.keyword, reset, count), "unknown keyword") end
		end
	elseif op == "DECK_BUILD_RESTRICTION" then
		context.last_action_succeeded = true
		return {}
	elseif op == "ADD_DON" then
		local maximum = action.mode == "UP_TO"
			and math.min(action.count or 1, opcg.DonDeckCount(player)) or (action.count or 1)
		local amount = choose_number_up_to(chooser, maximum, action.mode)
		context.last_action_succeeded = amount == 0 and action.mode == "UP_TO"
			or opcg.AddDon(player, amount, action.state) > 0
		return {}
	elseif op == "GIVE_DON" then
		cards = choose_selector(action.selector, context)
		local per_target = action.per_target and (action.count or 1) or nil
		local moved = 0
		if per_target then
			for _, card in ipairs(cards) do moved = moved + opcg.GiveDon(player, card, per_target, action.state) end
		elseif cards[1] then moved = opcg.GiveDon(player, cards[1], action.count or 1, action.state) end
		context.last_action_succeeded = moved > 0 or (action.mode == "UP_TO")
		return cards
	elseif op == "SET_DON_ACTIVE" then
		local maximum = action.mode == "UP_TO"
			and math.min(action.count or 1, opcg.RestedDon(player)) or (action.count or 1)
		local amount = choose_number_up_to(chooser, maximum, action.mode)
		context.last_action_succeeded = amount == 0 and action.mode == "UP_TO"
			or opcg.SetDonActive(player, amount, context) > 0
		return {}
	elseif op == "REST_DON" then
		local maximum = action.mode == "UP_TO"
			and math.min(action.count or 1, opcg.ActiveDon(player)) or (action.count or 1)
		local amount = choose_number_up_to(chooser, maximum, action.mode)
		context.last_action_succeeded = amount == 0 and action.mode == "UP_TO"
			or opcg.RestDon(player, amount) > 0
		return {}
	elseif op == "RETURN_DON" then
		local minimum = action.mode == "EXACT" and (action.count or 1) or 0
		context.last_action_succeeded = opcg.ReturnDon(player, action.count or 1, chooser, action.state, minimum) >= minimum
		return {}
	elseif op == "MILL_DECK" then
		local n = choose_number_up_to(chooser,
			math.min(action.count or 0, Duel.GetFieldGroupCount(player, LOCATION_DECK, 0)),
			action.mode)
		local group = Duel.GetDecktopGroup(player, n)
		context.last_action_succeeded = n == 0 and action.mode == "UP_TO"
			or Duel.SendtoGrave(group, REASON_EFFECT) > 0
		return {}
	elseif op == "ADD_FROM_TRASH" then
		if action.destination ~= "HAND" then error("unsupported trash destination") end
		local minimum = action.mode == "EXACT" and (action.count or 1) or 0
		cards = assert(select_zone(player, LOCATION_GRAVE, action.filter, minimum, action.count or 1, chooser, context))
		remove_cards(cards, REASON_EFFECT, "HAND")
	elseif op == "RETURN_TRASH_TO_DECK_BOTTOM" then
		cards = assert(select_zone(player, LOCATION_GRAVE, action.filter, action.count or 1,
			action.count or 1, chooser, context))
		remove_cards(cards, REASON_EFFECT, "DECK_BOTTOM")
		if action.order == "CHOOSE" and #cards > 1 then Duel.SortDeckbottom(chooser, player, #cards) end
	elseif op == "PLAY_FROM_HAND" then return play_from_zone(action, LOCATION_HAND, context)
	elseif op == "PLAY_FROM_TRASH" then return play_from_zone(action, LOCATION_GRAVE, context)
	elseif op == "PLAY_FROM_HAND_OR_TRASH" then return play_from_zone(action, LOCATION_HAND + LOCATION_GRAVE, context)
	elseif op == "PLAY_FROM_DECK_TOP" then return play_from_deck_top(action, context)
	elseif op == "PLAY_FROM_LIFE_TOP" then return play_from_life_top(action, context)
	elseif op == "PLAY_SELF" then
		cards = play_card(context.card, controller(context), chooser, action.rested == true, context)
			and { context.card } or {}
	elseif op == "MODIFY_NEXT_PLAY_COST" then
		-- registers a per-player discount consumed by the play proc
		opcg.AddPlayDiscount(player, {
			amount = action.amount or 0,
			uses = action.uses or 1,
			turn = Duel.GetTurnCount and Duel.GetTurnCount() or 0,
			predicate = filter_for(action.filter, context),
		})
		context.last_action_succeeded = true
		return {}
	elseif op == "SHUFFLE_DECK" then
		Duel.ShuffleDeck(player)
		context.last_action_succeeded = true
		return {}
	elseif op == "ADD_SELF_TO_HAND" then
		cards = { context.card }
		remove_cards(cards, REASON_EFFECT, "HAND")
	elseif op == "SEARCH_DECK_TOP" then
		return search_deck_top(action, context)
	elseif op == "PLAY_FROM_DECK_TOP" then
		return play_from_deck_top(action, context)
	elseif op == "LOOK_REORDER_DECK_TOP" then
		return look_reorder_deck_top(action, context)
	elseif op == "REVEAL_DECK_TOP" then
		local count = math.min(action.count or action.look_count or 1, Duel.GetFieldGroupCount(player, LOCATION_DECK, 0))
		local top = Duel.GetDecktopGroup(player, count)
		-- an actual 공개: BOTH players see it. Deck-location ConfirmCards
		-- routes to a single player, so use the public decktop broadcast.
		if count > 0 then
			if Duel.ConfirmDecktop then Duel.ConfirmDecktop(player, count)
			else Duel.ConfirmCards(chooser, top) Duel.ConfirmCards(other(chooser), top) end
		end
		context.last_action_succeeded = count > 0
		return {}
	elseif op == "ADD_LIFE_FROM_DECK_TOP" then
		if action.schedule then
			local scheduled = {}
			for key, value in pairs(action) do scheduled[key] = value end
			scheduled.schedule = nil
			context.last_action_succeeded = opcg.contract_ops.schedule(action.schedule, context.card,
				function() add_life_from_deck(scheduled, context) end)
		else
			context.last_action_succeeded = add_life_from_deck(action, context)
		end
		return {}
	elseif op == "ADD_LIFE_FROM_HAND" then return add_life_from_hand(action, context)
	elseif op == "ADD_TO_LIFE" or op == "ADD_TO_OWNER_LIFE" then return add_selected_to_life(action, context)
	elseif op == "RETURN_LIFE_TO_DECK" then return return_life_to_deck(action, context)
	elseif op == "REVEAL_HAND" then
		local minimum = action.mode == "UP_TO" and 0 or (action.count or 1)
		cards = assert(select_zone(player, LOCATION_HAND, action.filter, minimum, action.count or 1, chooser, context))
		reveal_cards_to(chooser, cards)
	elseif op == "TAKE_LIFE_TO_HAND" or op == "TRASH_LIFE_TOP" then
		local amount = choose_number_up_to(chooser, math.min(action.count or 1, life_count(player)), action.mode)
		for _ = 1, amount do
			local card = choose_life(player, action.position or "TOP", chooser)
			if not card then
				if action.mode == "EXACT" then error("life is empty") end
				break
			end
			cards[#cards + 1] = card
			if op == "TAKE_LIFE_TO_HAND" then Duel.SendtoHand(card, player, REASON_EFFECT)
			else Duel.SendtoGrave(card, REASON_EFFECT) end
		end
		context.last_action_succeeded = #cards > 0 or action.mode == "UP_TO"
		if #cards > 0 and opcg.life and opcg.life.notify_decreased then
			opcg.life.notify_decreased(player, context, #cards)
		end
	elseif op == "RETURN_HAND_TO_DECK" then
		local minimum = action.mode == "UP_TO" and 0 or (action.count or 1)
		cards = assert(select_zone(player, LOCATION_HAND, action.filter, minimum,
			action.count or 1, chooser, context))
		remove_cards_to_chosen_deck(cards, REASON_EFFECT, action, chooser, player)
		if action.shuffle then Duel.ShuffleDeck(player) end
	elseif op == "RETURN_OWN_CARD_TO_DECK_BOTTOM" or op == "REST_OWN_CARD" then
		cards = choose_selector(action.selector, context)
		if op == "REST_OWN_CARD" then for _, card in ipairs(cards) do opcg.SetRested(card) end
		else remove_cards(cards, REASON_EFFECT, "DECK_BOTTOM") end
	elseif op == "ACTIVATE_CARD_EFFECT" then
		if choose_number_up_to(chooser, action.count or 1, action.mode) == 0 then
			context.last_action_succeeded = action.mode == "UP_TO"
			return {}
		end
		local timing = action.effect_timing or "MAIN"
		context.last_action_succeeded = #(C.DispatchTiming(context.card, timing, context) or {}) > 0
		return {}
	elseif op == "CHOOSE" then
		local available = {}
		for index, option in ipairs(action.options or {}) do
			if nested_conditions_match((action.option_conditions or {})[index], context) then
				available[#available + 1] = { index=index, actions=option }
			end
		end
		if #available == 0 then context.last_action_succeeded = false return {} end
		local descriptions = {}
		local code = context.card:GetOriginalCode()
		for _, option in ipairs(available) do descriptions[#descriptions + 1] = aux.Stringid(code, option.index - 1) end
		local selected = #available == 1 and 1 or (Duel.SelectOption(chooser, table.unpack(descriptions)) + 1)
		execute_nested(available[selected].actions, context)
		context.last_action_succeeded = true
		return {}
	elseif op == "IF" then
		local matched = nested_conditions_match(action.conditions, context)
		if matched then execute_nested(action.actions, context) end
		context.last_action_succeeded = matched
		return {}
	elseif op == "TRANSFER_ATTACHED_DON" then
		cards = choose_selector(action.selector, context)
		if cards[1] then
			local source = context.card:GetOverlayGroup():Filter(opcg.IsDon, nil)
			local n = math.min(action.count or 1, source:GetCount())
			local selected = source:Select(chooser, action.mode == "EXACT" and n or 0, n, nil)
			Duel.Overlay(cards[1], selected)
			context.last_action_succeeded = selected:GetCount() > 0
		end
		return cards
	else
		if opcg.contract_ops and opcg.contract_ops.execute then
			local value, reason = opcg.contract_ops.execute(op, action, context)
			if reason then error(reason .. ": " .. tostring(op)) end
			if value ~= nil then return value end
		end
		error("unsupported OPCG action: " .. tostring(op))
	end
	context.last_action_succeeded = true
	return remember_targets(context, cards)
end

local function condition_shape_supported(condition, card)
	if not CONDITION[condition.op] then return false end
	return not condition.filter or filter_for(condition.filter, { card=card }) ~= nil
end
local function cost_shape_supported(cost, card)
	if not COST[cost.op] then return false end
	if cost.filter and not filter_for(cost.filter, { card=card }) then return false end
	if cost.selector then
		if cost.selector.kind ~= "SELF" and cost.selector.kind ~= "LAST_TARGET"
			and cost.selector.kind ~= "EVENT_TARGET" and cost.selector.kind ~= "BATTLE_ATTACKER"
			and not opcg.KindPredicate(cost.selector.kind) then return false end
		if cost.selector.filter and not filter_for(cost.selector.filter, { card=card }) then return false end
	end
	if cost.op == "ALTERNATIVE_COST" then
		for _, option in ipairs(cost.options or {}) do
			for _, nested in ipairs(option) do if not cost_shape_supported(nested, card) then return false end end
		end
	end
	return true
end
local function action_shape_supported(action, card)
	if not ACTION[action.op] then return false end
	if action.filter and not filter_for(action.filter, { card=card }) then return false end
	if action.selector then
		if action.selector.kind ~= "SELF" and action.selector.kind ~= "LAST_TARGET"
			and action.selector.kind ~= "EVENT_TARGET" and action.selector.kind ~= "BATTLE_ATTACKER"
			and not opcg.KindPredicate(action.selector.kind) then return false end
		if action.selector.filter and not filter_for(action.selector.filter, { card=card }) then return false end
	end
	if (action.op == "MODIFY_POWER" or action.op == "MODIFY_COST"
			or action.op == "MODIFY_COUNTER" or action.op == "GAIN_KEYWORD")
			and action.duration ~= "WHILE_CONDITION"
		and action.duration ~= "RULE"
		and not effect_reset(action.duration) then return false end
	if (action.op == "TRASH" or action.op == "RETURN_TO_DECK_BOTTOM") and action.schedule
		and action.schedule ~= "THIS_TURN_END" and action.schedule ~= "THIS_BATTLE_END" then return false end
	if action.op == "PLAY_FROM_HAND" or action.op == "PLAY_FROM_TRASH"
		or action.op == "PLAY_FROM_HAND_OR_TRASH" or action.op == "PLAY_FROM_DECK_TOP"
		or action.op == "PLAY_FROM_LIFE_TOP" then
		local kind = action.filter and action.filter.card_type
		if kind ~= nil and kind ~= "CHARACTER" and kind ~= "STAGE" then return false end
	end
	if action.op == "SEARCH_DECK_TOP" then
		if action.schedule then return false end
		if action.destination ~= "HAND" and action.destination ~= "TRASH"
			and action.destination ~= "LIFE_TOP" then return false end
		if not action.rest_destinations and action.rest_destination ~= "DECK_BOTTOM"
			and action.rest_destination ~= "TRASH" then return false end
	end
	if (action.op == "SEARCH_DECK_TOP" or action.op == "PLAY_FROM_DECK_TOP") then
		if action.schedule then return false end
		if action.rest_destination ~= nil and action.rest_destination ~= "DECK_BOTTOM" and action.rest_destination ~= "TRASH"
			-- DECK_TOP (leave unplayed cards in place) is a PLAY_FROM_DECK_TOP-only shape
			and not (action.op == "PLAY_FROM_DECK_TOP" and action.rest_destination == "DECK_TOP") then return false end
	end
	if action.op == "ADD_LIFE_FROM_DECK_TOP" and action.schedule
		and action.schedule ~= "THIS_TURN_END" then return false end
	if action.op == "MODIFY_NEXT_PLAY_COST" then
		if action.duration ~= nil and action.duration ~= "THIS_TURN"
			and action.duration ~= "WHILE_CONDITION" then return false end
		if action.zone ~= nil and action.zone ~= "HAND" then return false end
	end
	if action.op == "IF" or action.op == "CHOOSE" then
		for _, condition in ipairs(action.conditions or {}) do
			if not condition_shape_supported(condition, card) then return false end
		end
		for _, nested in ipairs(action.actions or {}) do
			if not action_shape_supported(nested, card) then return false end
		end
		for _, option in ipairs(action.options or {}) do
			for _, nested in ipairs(option) do if not action_shape_supported(nested, card) then return false end end
		end
		for _, conditions in ipairs(action.option_conditions or {}) do
			for _, condition in ipairs(conditions) do if not condition_shape_supported(condition, card) then return false end end
		end
	end
	for _, cost in ipairs(action.replacement_costs or {}) do
		if not cost_shape_supported(cost, card) then return false end
	end
	for _, nested in ipairs(action.replacement_actions or {}) do if not action_shape_supported(nested, card) then return false end end
	for _, nested in ipairs(action.on_match or {}) do if not action_shape_supported(nested, card) then return false end end
	return true
end
local function effect_is_continuous(effect)
	local timings = effect.timings or {}
	if #timings == 0 then return false end
	for _, t in ipairs(timings) do
		if not (t == "CONTINUOUS" or t == "CONTINUOUS_YOUR_TURN"
			or t == "CONTINUOUS_OPPONENT_TURN" or t == "RULE") then return false end
	end
	return true
end
local PER_COUNT_SOURCE = { RESTED_DON=true, TRASH=true, HAND=true, CHARACTER=true }
local PER_COUNT_LOCATION = { TRASH=LOCATION_GRAVE, HAND=LOCATION_HAND }
local CONTINUOUS_ONLY = { MODIFY_POWER_PER_COUNT=true, MODIFY_COST_PER_COUNT=true }
local KO_REASON = { BATTLE=true, OPPONENT_BATTLE=true, EFFECT=true, OPPONENT_EFFECT=true, ANY=true }
local function count_source(action, player, card)
	if action.source == "RESTED_DON" then
		-- No current IR action filters DON cards. Reject such a shape until the
		-- DON group itself is exposed instead of silently ignoring the filter.
		if action.filter and next(action.filter) ~= nil then return nil end
		return opcg.RestedDon(player)
	end
	if action.source == "CHARACTER" then
		local context = { card=card, player=player }
		local predicate = filter_for(action.filter, context)
		if not predicate then return nil end
		return Duel.GetMatchingGroupCount(function(c)
			return opcg.IsCharacter(c) and predicate(c)
		end, player, LOCATION_MZONE, 0, nil)
	end
	local location = PER_COUNT_LOCATION[action.source]
	if not location then return nil end
	local context = { card=card, player=player }
	local predicate = filter_for(action.filter, context)
	if not predicate then return nil end
	return Duel.GetMatchingGroupCount(predicate, player, location, 0, nil)
end
local function per_count_value(action)
	local divisor = action.divisor or 1
	local per = action.amount_per or 0
	return function(e, c)
		local context = { card=c, player=e:GetHandlerPlayer() }
		local player = context_player(action.player, context)
		local n = count_source(action, player, c)
		if not n then return 0 end
		return math.floor(n / divisor) * per
	end
end
local function ko_immunity(action, card)
	local reason = action.reason
	local context = { card=card, player=card:GetControler() }
	local attacker_filter = action.attacker_filter and filter_for(action.attacker_filter, context) or nil
	if reason == "BATTLE" then
		if attacker_filter then
			return EFFECT_INDESTRUCTABLE_BATTLE, function(_, opponent)
				return opponent ~= nil and attacker_filter(opponent)
			end
		end
		return EFFECT_INDESTRUCTABLE_BATTLE, function() return true end
	elseif reason == "OPPONENT_BATTLE" then
		return EFFECT_INDESTRUCTABLE_BATTLE, function() return true end
	elseif reason == "OPPONENT_EFFECT" then
		return EFFECT_INDESTRUCTABLE_EFFECT, function(e, _, rp)
			return rp ~= e:GetHandlerPlayer()
		end
	elseif reason == "EFFECT" then
		return EFFECT_INDESTRUCTABLE_EFFECT, function() return true end
	elseif reason == "ANY" then
		return EFFECT_INDESTRUCTABLE, function() return true end
	end
	return nil, nil
end
local function effect_shape_supported(effect, card)
	for _, condition in ipairs(effect.conditions or {}) do
		if not condition_shape_supported(condition, card) then return false end
	end
	for _, cost in ipairs(effect.costs or {}) do if not cost_shape_supported(cost, card) then return false end end
	for _, action in ipairs(effect.actions or {}) do
		if not action_shape_supported(action, card) then return false end
		if CONTINUOUS_ONLY[action.op] and not effect_is_continuous(effect) then return false end
		if action.op == "MODIFY_POWER_PER_COUNT" or action.op == "MODIFY_COST_PER_COUNT" then
			if not PER_COUNT_SOURCE[action.source] then return false end
			if type(action.divisor) ~= "number" or action.divisor <= 0 then return false end
			if type(action.amount_per) ~= "number" then return false end
			if action.source == "RESTED_DON" and action.filter and next(action.filter) ~= nil then return false end
		end
	end
	return true
end
local function runtime_context(card, player)
	return { card=card, player=player, turn_id=Duel.GetTurnCount and Duel.GetTurnCount() or 0 }
end
-- Exposed so the runtime can fail-closed on the QUEUE path too: BindCard gates
-- its native registrations with this, but effect_queue reads IR definitions
-- directly -- without this gate an unsupported action would pay its costs and
-- then fizzle inside pcall.
function C.EffectShapeSupported(effect, card)
	return effect_shape_supported(effect, card)
end
local function register_trigger(card, effect, code, range, effect_index, timing)
	if opcg.effect_queue then
		local collector = opcg.effect_queue.register_trigger(card, effect, code, {
			range=range,
			description_index=effect_index,
			timing=timing,
		})
		return collector
	end
	local native = Effect.CreateEffect(card)
	local optional = #(effect.costs or {}) > 0 or string.find(effect.source_text or "", "수 있다", 1, true) ~= nil
	native:SetType(EFFECT_TYPE_SINGLE + (optional and EFFECT_TYPE_TRIGGER_O or EFFECT_TYPE_TRIGGER_F))
	native:SetCode(code)
	if range then native:SetRange(range) end
	native:SetCondition(function(e)
		local context = runtime_context(e:GetHandler(), e:GetHandler():GetControler())
		context.timing = timing
		return opcg.runtime.can_resolve(e:GetHandler(), effect.effect_id, context)
	end)
	native:SetOperation(function(e, player)
		local context = runtime_context(e:GetHandler(), player)
		context.timing = timing
		opcg.runtime.resolve(e:GetHandler(), effect.effect_id, context)
	end)
	card:RegisterEffect(native)
	return native
end
local function register_event_play(card, effect)
	-- [Main] on an EVENT card: played from hand -- rest the card's DON cost,
	-- resolve the IR effect, and the spent spell reaches the trash through the
	-- normal resolution flow. EFFECT_TYPE_ACTIVATE is only the carrier.
	local native = Effect.CreateEffect(card)
	native:SetType(EFFECT_TYPE_IGNITION)
	native:SetCode(EVENT_FREE_CHAIN)
	native:SetRange(LOCATION_HAND)
	native:SetCondition(function(e, tp)
		if Duel.GetCurrentPhase() ~= PHASE_MAIN1 then return false end
		return opcg.runtime.can_resolve(e:GetHandler(), effect.effect_id,
			runtime_context(e:GetHandler(), tp))
	end)
	native:SetCost(function(e, tp, eg, ep, ev, re, r, rp, chk)
		local cost = opcg.GetCost(e:GetHandler())
		if chk == 0 then return opcg.CanRestDon(tp, cost) end
		opcg.RestDon(tp, cost)
		Duel.SendtoGrave(e:GetHandler(),REASON_COST)
	end)
	native:SetOperation(function(e, tp)
		local handler = e:GetHandler()
		local context = runtime_context(handler, tp)
		context.event_target = handler
		context.event_targets = {handler}
		context.event_cards = {handler}
		context.event_count = 1
		context.event_player = tp
		context.effect_play = true
		if opcg.contract_ops then
			opcg.contract_ops.emit("ON_YOUR_EVENT_ACTIVATED", context, tp)
			opcg.contract_ops.emit("ON_OPPONENT_EVENT_ACTIVATED", context, 1 - tp)
			opcg.contract_ops.emit("ON_OPPONENT_EVENT_OR_TRIGGER_ACTIVATED", context, 1 - tp)
			opcg.contract_ops.emit("ON_OPPONENT_BLOCKER_OR_EVENT_ACTIVATED", context, 1 - tp)
			opcg.contract_ops.emit("ON_OPPONENT_HIGH_COST_OR_EFFECT_PLAY", context, 1 - tp)
		end
		opcg.runtime.resolve(handler, effect.effect_id, context)
	end)
	card:RegisterEffect(native)
	return true
end
local function register_main(card, effect)
	if opcg.IsEvent(card) then return register_event_play(card, effect) end
	local native = Effect.CreateEffect(card)
	native:SetType(EFFECT_TYPE_IGNITION)
	native:SetRange(opcg.IsStage(card) and LOCATION_FZONE or LOCATION_MZONE)
	native:SetCondition(function(e, player)
		return opcg.runtime.can_resolve(e:GetHandler(), effect.effect_id,
			runtime_context(e:GetHandler(), player))
	end)
	native:SetOperation(function(e, player)
		opcg.runtime.resolve(e:GetHandler(), effect.effect_id, runtime_context(e:GetHandler(), player))
	end)
	card:RegisterEffect(native)
	return true
end
local function continuous_condition(card, effect, your_turn, opponent_turn)
	return function()
		local player = card:GetControler()
		if your_turn and Duel.GetTurnPlayer() ~= player then return false end
		if opponent_turn and Duel.GetTurnPlayer() == player then return false end
		if effect.don_attached and opcg.GetAttachedDon(card) < effect.don_attached then return false end
		local context = runtime_context(card, player)
		for _, condition in ipairs(effect.conditions or {}) do
			if not C.CheckCondition(condition.op, condition, context) then return false end
		end
		return true
	end
end
local function register_continuous(card, effect, your_turn, opponent_turn)
	if #(effect.costs or {}) > 0 then return false end
	for _, action in ipairs(effect.actions or {}) do
		local condition = continuous_condition(card, effect, your_turn, opponent_turn)
		local extended = opcg.contract_ops and opcg.contract_ops.register_continuous
			and opcg.contract_ops.register_continuous(card, effect, action, condition)
		if not extended then
		local effect_code = action.op == "MODIFY_POWER" and EFFECT_UPDATE_ATTACK
			or action.op == "MODIFY_COST" and EFFECT_UPDATE_LEVEL
			or action.op == "MODIFY_COUNTER" and EFFECT_UPDATE_DEFENSE
			or action.op == "MODIFY_POWER_PER_COUNT" and EFFECT_UPDATE_ATTACK
			or action.op == "MODIFY_COST_PER_COUNT" and EFFECT_UPDATE_LEVEL
			or action.op == "GAIN_KEYWORD" and opcg.KEYWORD_EFFECT[action.keyword]
		local rest_code, rest_value
		if not effect_code then
			if action.op == "CANNOT_BE_KO" then
				rest_code, rest_value = ko_immunity(action, card)
				if not rest_code then return false end
			else
				return false
			end
		end
		local selector = action.selector or {}
		local predicate = selector.kind == "SELF" and function(c) return c == card end
			or opcg.KindPredicate(selector.kind)
		local filter = filter_for(selector.filter, { card=card, player=card:GetControler() })
		if not predicate or not filter then return false end
		local native = Effect.CreateEffect(card)
		native:SetCode(rest_code or effect_code)
		if rest_code then native:SetValue(rest_value)
		elseif action.op == "MODIFY_POWER_PER_COUNT" or action.op == "MODIFY_COST_PER_COUNT" then native:SetValue(per_count_value(action))
		elseif action.op ~= "GAIN_KEYWORD" then native:SetValue(action.amount or 0) end
		native:SetCondition(continuous_condition(card, effect, your_turn, opponent_turn))
		if selector.kind == "SELF" then
			native:SetType(EFFECT_TYPE_SINGLE)
			native:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
			native:SetRange(LOCATION_MZONE)
		else
			native:SetType(EFFECT_TYPE_FIELD)
			native:SetRange(opcg.IsStage(card) and LOCATION_FZONE or LOCATION_MZONE)
			if selector.owner == "OPPONENT" then native:SetTargetRange(0, LOCATION_MZONE)
			elseif selector.owner == "ANY" then native:SetTargetRange(LOCATION_MZONE, LOCATION_MZONE)
			else native:SetTargetRange(LOCATION_MZONE, 0) end
			native:SetTarget(function(_, target) return predicate(target) and filter(target) end)
		end
		card:RegisterEffect(native)
		end
	end
	return true
end

function C.BindCard(card, definition)
	if opcg.rules and opcg.rules.register_game_start then opcg.rules.register_game_start() end
	-- Stages need a play action (rest DON -> face-up on the stage zone); without
	-- it a TYPE_FIELD spell's only stock idle command is a face-down Set.
	if opcg.IsStage(card) and opcg.rules and opcg.rules.register_stage_play then
		opcg.rules.register_stage_play(card)
	end
	for effect_index, effect in ipairs(definition.effects or {}) do
		if effect_shape_supported(effect, card) then
			local continuous, your_turn, opponent_turn = false, false, false
			for _, timing in ipairs(effect.timings or {}) do
				if timing == "CONTINUOUS" or timing == "RULE"
					or timing == "CONTINUOUS_YOUR_TURN" or timing == "CONTINUOUS_OPPONENT_TURN" then continuous = true end
				if timing == "CONTINUOUS_YOUR_TURN" then your_turn = true end
				if timing == "CONTINUOUS_OPPONENT_TURN" then opponent_turn = true end
				if timing == "ON_PLAY" and (opcg.IsCharacter(card) or opcg.IsLeader(card)) then
					-- OPCG "play/appear" is a semantic event emitted by opcg.EmitPlayed.
					-- Do not bind it to native YGO summon/special-summon success.
				end
				if (ENGINE_SEMANTIC_TIMING[timing] or EMIT_ENGINE_TIMING[timing])
					and opcg.effect_queue and opcg.effect_queue.register_semantic then
					opcg.effect_queue.register_semantic(card, effect, timing, {
						description_index=effect_index,
					})
				end
				if timing == "WHEN_ATTACKING" then
					register_trigger(card, effect, EVENT_ATTACK_ANNOUNCE, LOCATION_MZONE, effect_index, timing)
				end
				if timing == "ON_KO" then
					-- range must be GRAVE: the KO'd card is already in the trash
					-- when EVENT_DESTROYED processes, and the core's single-event
					-- gate (is_activateable -> in_range) kills range-less effects.
					-- NOTE: battle KOs raise the event from opcg_battle's ko=
					-- (stock send_to only raises it for non-battle destroys).
					local native = register_trigger(card, effect, EVENT_DESTROYED, LOCATION_GRAVE, effect_index, timing)
					native:SetCondition(function(e)
						local handler = e:GetHandler()
						return handler:IsReason(REASON_DESTROY)
							and handler:IsPreviousLocation(LOCATION_MZONE)
					end)
				end
				if timing == "ON_OPPONENT_ATTACK" and opcg.effect_queue then
					local native = opcg.effect_queue.register_trigger(card, effect,
						EVENT_ATTACK_ANNOUNCE, {
							field=true,
							range=opcg.IsStage(card) and LOCATION_FZONE or LOCATION_MZONE,
							description_index=effect_index,
							timing=timing,
						})
					native:SetCondition(function(e, _, _, event_player)
						return event_player ~= e:GetHandler():GetControler()
					end)
				end
				if timing == "ACTIVATE_MAIN" or timing == "MAIN" then register_main(card, effect) end
				if timing == "YOUR_TURN_END" then
					-- EVENT_PHASE is raised field-wide: the core's PhaseEvent scans
					-- only the trigger and FIELD-continuous indexes, so a SINGLE
					-- continuous collector would never fire. The label carries the
					-- once-per-turn consumption (the phase re-collects until no
					-- continuous effect is activateable).
					local native
					if opcg.effect_queue then
						native = opcg.effect_queue.register_trigger(card, effect, EVENT_PHASE + PHASE_END, {
							field=true,
							once_per_turn=true,
							range=opcg.IsStage(card) and LOCATION_FZONE or LOCATION_MZONE,
							description_index=effect_index,
							timing=timing,
						})
					else
						native = register_trigger(card, effect, EVENT_PHASE + PHASE_END,
							opcg.IsStage(card) and LOCATION_FZONE or LOCATION_MZONE, effect_index, timing)
					end
					native:SetCondition(function(e)
						local player = e:GetHandler():GetControler()
						if Duel.GetTurnPlayer() ~= player then return false end
						if e:GetLabel() == Duel.GetTurnCount() then return false end
						local context = runtime_context(e:GetHandler(), player)
						context.timing = timing
						return opcg.runtime.can_resolve(e:GetHandler(), effect.effect_id, context)
					end)
				end
			end
			if continuous then register_continuous(card, effect, your_turn, opponent_turn) end
		end
	end
	if opcg.battle and opcg.battle.register_attack_action then
		opcg.battle.register_attack_action(card)
	end
	return true
end

function C.DispatchTiming(card, timing, context)
	context = context or {}
	context.card = context.card or card
	context.player = context.player == nil and card:GetControler() or context.player
	context.turn_id = context.turn_id or (Duel.GetTurnCount and Duel.GetTurnCount() or 0)
	return opcg.runtime.dispatch(card, timing, context)
end
function C.QuarantineCard() return true end
function C.AdvanceBoundary(boundary, context)
	if opcg.contract_ops and opcg.contract_ops.advance_boundary then
		return opcg.contract_ops.advance_boundary(boundary, context)
	end
	return {executed={}, expired={}}
end
function C.GetSupportedOperations()
	return { conditions=CONDITION, costs=COST, actions=ACTION, timings=NATIVE_TIMING }
end

return C

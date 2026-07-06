-- Lua implementation of the OPCGCore bridge.
-- It deliberately fails closed when an operation, selector, duration, or timing
-- cannot be represented exactly with the currently exposed ocgcore primitives.
OPCGCore = OPCGCore or {}
local C = OPCGCore

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
	FIELD_DON_GTE=true, FIELD_DON_LTE=true, FIELD_DON_EQ=true,
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
}
local COST = {
	TRASH_HAND=true, RETURN_DON=true, REST_SELF=true, REST_DON=true,
	TRASH_SELF=true, REST_OWN_CARD=true, RETURN_TRASH_TO_DECK_BOTTOM=true,
	RETURN_OWN_CARD_TO_HAND=true, RETURN_OWN_CARD_TO_DECK_BOTTOM=true,
	RETURN_SELF_TO_DECK_BOTTOM=true, TRASH_OWN_CARD=true, RETURN_SELF_TO_HAND=true,
	GIVE_DON=true, RETURN_HAND_TO_DECK=true, KO_OWN_CARD=true,
	RETURN_ATTACHED_DON=true, TAKE_LIFE_TO_HAND=true, TRASH_LIFE_TOP=true,
	FLIP_LIFE_TOP=true, MILL_DECK=true, REVEAL_HAND=true,
	MODIFY_OWN_POWER=true,
}
local ACTION = {
	DRAW=true, TRASH_HAND=true, MODIFY_POWER=true, REST=true, SET_ACTIVE=true,
	KO=true, TRASH=true, RETURN_TO_HAND=true, RETURN_TO_DECK_BOTTOM=true,
	ADD_DON=true, GIVE_DON=true, SET_DON_ACTIVE=true, REST_DON=true,
	RETURN_DON=true, MILL_DECK=true, ADD_FROM_TRASH=true,
	RETURN_TRASH_TO_DECK_BOTTOM=true, PLAY_FROM_HAND=true, PLAY_FROM_TRASH=true,
	PLAY_SELF=true, SHUFFLE_DECK=true, ADD_SELF_TO_HAND=true, IF=true,
	TRANSFER_ATTACHED_DON=true, MODIFY_COST=true, MODIFY_COUNTER=true,
	GAIN_KEYWORD=true, SEARCH_DECK_TOP=true, ADD_LIFE_FROM_DECK_TOP=true,
	TAKE_LIFE_TO_HAND=true, TRASH_LIFE_TOP=true, ACTIVATE_CARD_EFFECT=true,
	CHOOSE=true, RETURN_HAND_TO_DECK=true, REST_SELF=true, TRASH_SELF=true,
	RETURN_SELF_TO_HAND=true, RETURN_OWN_CARD_TO_DECK_BOTTOM=true,
	REST_OWN_CARD=true,
	CANNOT_BE_KO=true,
	MODIFY_POWER_PER_COUNT=true,
	MODIFY_COST_PER_COUNT=true,
}
local NATIVE_TIMING = {
	CONTINUOUS=true, CONTINUOUS_YOUR_TURN=true, CONTINUOUS_OPPONENT_TURN=true,
	RULE=true, ON_PLAY=true, ACTIVATE_MAIN=true, MAIN=true, YOUR_TURN_END=true,
	WHEN_ATTACKING=true, ON_OPPONENT_ATTACK=true, ON_KO=true,
	ON_BLOCK=true, ON_OPPONENT_BLOCKER_ACTIVATED=true, COUNTER=true,
	LIFE_TRIGGER=true, END_OF_BATTLE=true,
	WHEN_ATTACKING_OR_ATTACKED=true, WHEN_BATTLING=true,
	AFTER_BATTLE_WITH_OPPONENT_CHARACTER=true, ON_BATTLE_KO=true,
	ON_DAMAGE_TO_OPPONENT_LIFE=true, ON_ANY_CHARACTER_KO=true,
	ON_OPPONENT_CHARACTER_KO=true, ON_SELF_KO=true,
	ON_YOUR_LIFE_DECREASED=true, ON_OPPONENT_LIFE_DECREASED=true,
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
local function remove_cards(cards, reason, destination)
	local group = array_group(cards)
	for _, card in ipairs(cards or {}) do
		if opcg.IsLeader(card) or opcg.IsCharacter(card) then opcg.ReturnAttachedDon(card) end
	end
	if destination == "HAND" then return Duel.SendtoHand(group, nil, reason) end
	if destination == "DECK_BOTTOM" then return Duel.SendtoDeck(group, nil, SEQ_DECKBOTTOM, reason) end
	return Duel.SendtoGrave(group, reason)
end
local function choose_selector(selector, context)
	local cards, reason = opcg.SelectCards(selector, context)
	if cards == nil then error(reason or "selector failed") end
	return remember_targets(context, cards)
end
local function leader(player) return opcg.GetLeader(player) end
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

	if op == "FIELD_DON_GTE" then return opcg.FieldDon(player) >= n end
	if op == "FIELD_DON_LTE" then return opcg.FieldDon(player) <= n end
	if op == "FIELD_DON_EQ" then return opcg.FieldDon(player) == n end
	if op == "FIELD_DON_LTE_OPPONENT" then return opcg.FieldDon(player) <= opcg.FieldDon(other(player)) end
	if op == "FIELD_DON_LT_OPPONENT" then return opcg.FieldDon(player) < opcg.FieldDon(other(player)) end
	if op == "FIELD_DON_BEHIND_BY_GTE" then return opcg.FieldDon(other(player)) - opcg.FieldDon(player) >= n end
	if op == "ACTIVE_DON_GTE" then return opcg.ActiveDon(player) >= n end
	if op == "ACTIVE_DON_LTE" then return opcg.ActiveDon(player) <= n end
	if op == "RESTED_DON_GTE" then return opcg.RestedDon(player) >= n end
	if op == "ALL_DON_RESTED" then return opcg.ActiveDon(player) == 0 and opcg.CostAreaDon(player) > 0 end
	if op == "ATTACHED_DON_GTE" then return opcg.GetAttachedDon(context.card) >= n end

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
		return Duel.SelectOption(chooser, 0, 1) == 0 and top or bottom
	end
	return nil
end
local function life_count(player)
	return Duel.GetFieldGroupCount(player, LOCATION_EXTRA, 0)
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
	if op == "TAKE_LIFE_TO_HAND" or op == "TRASH_LIFE_TOP" or op == "FLIP_LIFE_TOP" then
		return life_count(player) >= n
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
	return false
end

function C.PayCost(op, cost, context)
	context = context or {}
	local player = cost_player(context)
	local n = cost.count or cost.min_count or 1
	local cards
	if op == "TRASH_HAND" then
		cards = assert(select_zone(player, LOCATION_HAND, cost.filter, n, n, player, context))
		remove_cards(cards, REASON_COST + REASON_DISCARD, "TRASH")
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
		remove_cards(cards, REASON_COST, "DECK_BOTTOM")
		if cost.order == "CHOOSE" and #cards > 1 then Duel.SortDeckbottom(player, player, #cards) end
	elseif op == "RETURN_ATTACHED_DON" then
		local maximum = cost.max_count or n
		assert(opcg.ReturnAttachedDonToCost(context.card, n, maximum, player, cost.state) >= n,
			"RETURN_ATTACHED_DON failed")
	elseif op == "TAKE_LIFE_TO_HAND" or op == "TRASH_LIFE_TOP" or op == "FLIP_LIFE_TOP" then
		for _ = 1, n do
			local card = assert(choose_life(player, cost.position or "TOP", player), "life is empty")
			cards[#cards + 1] = card
			if op == "TAKE_LIFE_TO_HAND" then
				Duel.SendtoHand(card, player, REASON_COST)
			elseif op == "TRASH_LIFE_TOP" then
				Duel.SendtoGrave(card, REASON_COST)
			else
				Duel.ChangePosition(card, cost.faceup == false and POS_FACEDOWN_DEFENSE or POS_FACEUP_DEFENSE)
			end
		end
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
	else
		error("unsupported OPCG cost: " .. tostring(op))
	end
	return cards or {}
end

local function effect_reset(duration, source)
	if duration == "THIS_BATTLE" or duration == "END_OF_BATTLE" then return RESET_PHASE + PHASE_DAMAGE end
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
		local position = rested and POS_FACEUP_DEFENSE or POS_FACEUP_ATTACK
		return Duel.SpecialSummon(card, 0, player, player, false, false, position) > 0
	end
	if opcg.IsStage(card) then
		local current = opcg.GetStage(player)
		if current then remove_cards({ current }, REASON_RULE, "TRASH") end
		local position = rested and POS_FACEUP_DEFENSE or POS_FACEUP_ATTACK
		return Duel.MoveToField(card, player, player, LOCATION_FZONE, position, true)
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
	if action.rest_destinations or action.schedule then error("unsupported SEARCH_DECK_TOP shape") end
	local player = context_player(action.player, context)
	local chooser = controller(context)
	local look_count = math.min(action.look_count or 1, Duel.GetFieldGroupCount(player, LOCATION_DECK, 0))
	local top = Duel.GetDecktopGroup(player, look_count)
	if action.reveal ~= false then Duel.ConfirmCards(other(player), top) end
	local predicate = assert(filter_for(action.filter, context), "unsupported SEARCH_DECK_TOP filter")
	local candidates = top:Filter(predicate, nil)
	local maximum = math.min(action.select_count or 1, candidates:GetCount())
	local minimum = action.select_mode == "EXACT" and maximum or 0
	local selected = maximum > 0 and candidates:Select(chooser, minimum, maximum, nil) or Group.CreateGroup()
	local cards = {}
	for card in aux.Next(selected) do cards[#cards + 1] = card end
	top:Sub(selected)
	if action.destination == "HAND" then
		Duel.SendtoHand(selected, player, REASON_EFFECT)
	elseif action.destination == "TRASH" then
		Duel.SendtoGrave(selected, REASON_EFFECT)
	else
		error("unsupported SEARCH_DECK_TOP destination")
	end
	if top:GetCount() > 0 then
		if action.rest_destination == "TRASH" then
			Duel.SendtoGrave(top, REASON_EFFECT)
		elseif action.rest_destination == "DECK_BOTTOM" then
			local count = top:GetCount()
			Duel.SendtoDeck(top, player, SEQ_DECKBOTTOM, REASON_EFFECT)
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
	local amount = math.min(requested, available)
	if action.mode == "EXACT" and amount < requested then return false end
	for _ = 1, amount do
		local top = Duel.GetDecktopGroup(player, 1)
		Duel.Sendto(top, LOCATION_EXTRA, REASON_EFFECT, POS_FACEDOWN_DEFENSE, player, 0)
	end
	return amount > 0 or action.mode == "UP_TO"
end
local function nested_conditions_match(conditions, context)
	for _, condition in ipairs(conditions or {}) do
		if not C.CheckCondition(condition.op, condition, context) then return false end
	end
	return true
end
local function execute_nested(actions, context)
	local out = {}
	for _, action in ipairs(actions or {}) do out[#out + 1] = C.ExecuteAction(action.op, action, context) end
	return out
end

function C.ExecuteAction(op, action, context)
	context = context or {}
	local player = context_player(action.player, context)
	local chooser = controller(context)
	local cards = {}
	if op == "DRAW" then
		context.last_action_succeeded = Duel.Draw(player, action.count or 1, REASON_EFFECT) > 0
		return {}
	elseif op == "TRASH_HAND" then
		local minimum = action.mode == "UP_TO" and 0 or math.min(action.count or 1,
			Duel.GetFieldGroupCount(player, LOCATION_HAND, 0))
		cards = assert(select_zone(player, LOCATION_HAND, action.filter, minimum, action.count or 1,
			action.chooser == "OPPONENT" and other(chooser) or player, context))
		remove_cards(cards, REASON_EFFECT + REASON_DISCARD, "TRASH")
	elseif op == "REST_SELF" or op == "TRASH_SELF" or op == "RETURN_SELF_TO_HAND" then
		action = { selector={ owner="YOU", kind="SELF", count=1, mode="EXACT" } }
		op = op == "REST_SELF" and "REST" or op == "TRASH_SELF" and "TRASH" or "RETURN_TO_HAND"
		cards = choose_selector(action.selector, context)
	elseif op == "REST" or op == "SET_ACTIVE" or op == "KO" or op == "TRASH"
		or op == "RETURN_TO_HAND" or op == "RETURN_TO_DECK_BOTTOM" or op == "MODIFY_POWER"
		or op == "MODIFY_COST" or op == "MODIFY_COUNTER" or op == "GAIN_KEYWORD" then
		cards = choose_selector(action.selector, context)
		if op == "REST" then for _, card in ipairs(cards) do opcg.SetRested(card) end
		elseif op == "SET_ACTIVE" then for _, card in ipairs(cards) do opcg.SetActive(card) end
		elseif op == "KO" then remove_cards(cards, REASON_EFFECT + REASON_DESTROY, "TRASH")
		elseif op == "TRASH" then
			if action.schedule then error("scheduled TRASH requires native scheduler") end
			remove_cards(cards, REASON_EFFECT, "TRASH")
		elseif op == "RETURN_TO_HAND" then remove_cards(cards, REASON_EFFECT, "HAND")
		elseif op == "RETURN_TO_DECK_BOTTOM" then
			if action.schedule then error("scheduled deck return requires native scheduler") end
			remove_cards(cards, REASON_EFFECT, "DECK_BOTTOM")
			if action.order == "CHOOSE" and #cards > 1 then Duel.SortDeckbottom(chooser, player, #cards) end
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
	elseif op == "ADD_DON" then
		context.last_action_succeeded = opcg.AddDon(player, action.count or 1, action.state) > 0
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
		context.last_action_succeeded = opcg.SetDonActive(player, action.count or 1) > 0
		return {}
	elseif op == "REST_DON" then
		context.last_action_succeeded = opcg.RestDon(player, action.count or 1) > 0
		return {}
	elseif op == "RETURN_DON" then
		local minimum = action.mode == "EXACT" and (action.count or 1) or 0
		context.last_action_succeeded = opcg.ReturnDon(player, action.count or 1, chooser, action.state, minimum) >= minimum
		return {}
	elseif op == "MILL_DECK" then
		local n = math.min(action.count or 0, Duel.GetFieldGroupCount(player, LOCATION_DECK, 0))
		local group = Duel.GetDecktopGroup(player, n)
		context.last_action_succeeded = Duel.SendtoGrave(group, REASON_EFFECT) > 0
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
	elseif op == "PLAY_SELF" then
		cards = play_card(context.card, controller(context), chooser, action.rested == true, context)
			and { context.card } or {}
	elseif op == "SHUFFLE_DECK" then
		Duel.ShuffleDeck(player)
		context.last_action_succeeded = true
		return {}
	elseif op == "ADD_SELF_TO_HAND" then
		cards = { context.card }
		remove_cards(cards, REASON_EFFECT, "HAND")
	elseif op == "SEARCH_DECK_TOP" then
		return search_deck_top(action, context)
	elseif op == "ADD_LIFE_FROM_DECK_TOP" then
		context.last_action_succeeded = add_life_from_deck(action, context)
		return {}
	elseif op == "TAKE_LIFE_TO_HAND" or op == "TRASH_LIFE_TOP" then
		for _ = 1, action.count or 1 do
			local card = choose_life(player, action.position or "TOP", chooser)
			if not card then
				if action.mode == "EXACT" then error("life is empty") end
				break
			end
			cards[#cards + 1] = card
			if op == "TAKE_LIFE_TO_HAND" then Duel.SendtoHand(card, player, REASON_EFFECT)
			else Duel.SendtoGrave(card, REASON_EFFECT) end
		end
	elseif op == "RETURN_HAND_TO_DECK" then
		local minimum = action.mode == "UP_TO" and 0 or (action.count or 1)
		cards = assert(select_zone(player, LOCATION_HAND, action.filter, minimum,
			action.count or 1, chooser, context))
		remove_cards(cards, REASON_EFFECT, "DECK_BOTTOM")
		if action.order == "CHOOSE" and #cards > 1 then Duel.SortDeckbottom(chooser, player, #cards) end
		if action.shuffle then Duel.ShuffleDeck(player) end
	elseif op == "RETURN_OWN_CARD_TO_DECK_BOTTOM" or op == "REST_OWN_CARD" then
		cards = choose_selector(action.selector, context)
		if op == "REST_OWN_CARD" then for _, card in ipairs(cards) do opcg.SetRested(card) end
		else remove_cards(cards, REASON_EFFECT, "DECK_BOTTOM") end
	elseif op == "ACTIVATE_CARD_EFFECT" then
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
		if cost.selector.kind ~= "SELF" and not opcg.KindPredicate(cost.selector.kind) then return false end
		if cost.selector.filter and not filter_for(cost.selector.filter, { card=card }) then return false end
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
		and not effect_reset(action.duration) then return false end
	if (action.op == "TRASH" or action.op == "RETURN_TO_DECK_BOTTOM") and action.schedule then return false end
	if action.op == "PLAY_FROM_HAND" or action.op == "PLAY_FROM_TRASH" then
		local kind = action.filter and action.filter.card_type
		if kind ~= "CHARACTER" and kind ~= "STAGE" then return false end
	end
	if action.op == "SEARCH_DECK_TOP" then
		if action.schedule or action.rest_destinations then return false end
		if action.destination ~= "HAND" and action.destination ~= "TRASH" then return false end
		if action.rest_destination ~= "DECK_BOTTOM" and action.rest_destination ~= "TRASH" then return false end
	end
	if action.op == "ADD_LIFE_FROM_DECK_TOP" and action.schedule then return false end
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
local PER_COUNT_SOURCE = { RESTED_DON=true, TRASH=true, HAND=true }
local CONTINUOUS_ONLY = { CANNOT_BE_KO=true, MODIFY_POWER_PER_COUNT=true, MODIFY_COST_PER_COUNT=true }
local function count_source(source, player, card)
	if source == "RESTED_DON" then return opcg.RestedDon(player) end
	if source == "TRASH" then return Duel.GetFieldGroupCount(player, LOCATION_GRAVE, 0) end
	if source == "HAND" then return Duel.GetFieldGroupCount(player, LOCATION_HAND, 0) end
	return nil
end
local function per_count_value(action)
	local divisor = action.divisor or 1
	local per = action.amount_per or 0
	local source = action.source
	return function(e, c)
		local player = e:GetHandlerPlayer()
		local n = count_source(source, player, c)
		if not n then return 0 end
		return math.floor(n / divisor) * per
	end
end
local function ko_immunity(action)
	local reason = action.reason
	if reason == "BATTLE" then
		return EFFECT_INDESTRUCTABLE_BATTLE, function() return true end
	elseif reason == "OPPONENT_BATTLE" then
		return EFFECT_INDESTRUCTABLE_BATTLE, function(e, re, r, rp) return rp ~= e:GetHandlerPlayer() end
	elseif reason == "OPPONENT_EFFECT" then
		return EFFECT_INDESTRUCTABLE_EFFECT, function(e, re, r, rp) return rp ~= e:GetHandlerPlayer() end
	elseif reason == "EFFECT" then
		return EFFECT_INDESTRUCTABLE_EFFECT, function() return true end
	end
	return EFFECT_INDESTRUCTABLE, function() return true end
end
local function effect_shape_supported(effect, card)
	for _, condition in ipairs(effect.conditions or {}) do
		if not condition_shape_supported(condition, card) then return false end
	end
	for _, cost in ipairs(effect.costs or {}) do if not cost_shape_supported(cost, card) then return false end end
	for _, action in ipairs(effect.actions or {}) do
		if not action_shape_supported(action, card) then return false end
		if CONTINUOUS_ONLY[action.op] and not effect_is_continuous(effect) then return false end
		if (action.op == "MODIFY_POWER_PER_COUNT" or action.op == "MODIFY_COST_PER_COUNT") and not PER_COUNT_SOURCE[action.source] then return false end
	end
	return true
end
local function runtime_context(card, player)
	return { card=card, player=player, turn_id=Duel.GetTurnCount and Duel.GetTurnCount() or 0 }
end
local function register_trigger(card, effect, code, range, effect_index)
	if opcg.effect_queue then
		local collector = opcg.effect_queue.register_trigger(card, effect, code, {
			range=range,
			description_index=effect_index,
		})
		return collector
	end
	local native = Effect.CreateEffect(card)
	local optional = #(effect.costs or {}) > 0 or string.find(effect.source_text or "", "수 있다", 1, true) ~= nil
	native:SetType(EFFECT_TYPE_SINGLE + (optional and EFFECT_TYPE_TRIGGER_O or EFFECT_TYPE_TRIGGER_F))
	native:SetCode(code)
	if range then native:SetRange(range) end
	native:SetCondition(function(e)
		return opcg.runtime.can_resolve(e:GetHandler(), effect.effect_id,
			runtime_context(e:GetHandler(), e:GetHandler():GetControler()))
	end)
	native:SetOperation(function(e, player)
		opcg.runtime.resolve(e:GetHandler(), effect.effect_id, runtime_context(e:GetHandler(), player))
	end)
	card:RegisterEffect(native)
	return native
end
local function register_main(card, effect)
	if opcg.IsEvent(card) then return false end
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
		local effect_code = action.op == "MODIFY_POWER" and EFFECT_UPDATE_ATTACK
			or action.op == "MODIFY_COST" and EFFECT_UPDATE_LEVEL
			or action.op == "MODIFY_COUNTER" and EFFECT_UPDATE_DEFENSE
			or action.op == "MODIFY_POWER_PER_COUNT" and EFFECT_UPDATE_ATTACK
			or action.op == "MODIFY_COST_PER_COUNT" and EFFECT_UPDATE_LEVEL
			or action.op == "GAIN_KEYWORD" and opcg.KEYWORD_EFFECT[action.keyword]
		local rest_code, rest_value
		if not effect_code then
			if action.op == "CANNOT_BE_KO" then rest_code, rest_value = ko_immunity(action) else return false end
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
	return true
end

function C.BindCard(card, definition)
	if opcg.rules and opcg.rules.register_game_start then opcg.rules.register_game_start() end
	for effect_index, effect in ipairs(definition.effects or {}) do
		if effect_shape_supported(effect, card) then
			local continuous, your_turn, opponent_turn = false, false, false
			for _, timing in ipairs(effect.timings or {}) do
				if timing == "CONTINUOUS" or timing == "RULE"
					or timing == "CONTINUOUS_YOUR_TURN" or timing == "CONTINUOUS_OPPONENT_TURN" then continuous = true end
				if timing == "CONTINUOUS_YOUR_TURN" then your_turn = true end
				if timing == "CONTINUOUS_OPPONENT_TURN" then opponent_turn = true end
				if timing == "ON_PLAY" and (opcg.IsCharacter(card) or opcg.IsLeader(card)) then
					register_trigger(card, effect, EVENT_SPSUMMON_SUCCESS, nil, effect_index)
				end
				if timing == "WHEN_ATTACKING" then
					register_trigger(card, effect, EVENT_ATTACK_ANNOUNCE, nil, effect_index)
				end
				if timing == "ON_KO" then
					local native = register_trigger(card, effect, EVENT_DESTROYED, nil, effect_index)
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
						})
					native:SetCondition(function(e, _, _, event_player)
						return event_player ~= e:GetHandler():GetControler()
					end)
				end
				if timing == "ACTIVATE_MAIN" or timing == "MAIN" then register_main(card, effect) end
				if timing == "YOUR_TURN_END" then
					local native = register_trigger(card, effect, EVENT_PHASE + PHASE_END,
						opcg.IsStage(card) and LOCATION_FZONE or LOCATION_MZONE, effect_index)
					native:SetCondition(function(e)
						local player = e:GetHandler():GetControler()
						return Duel.GetTurnPlayer() == player and opcg.runtime.can_resolve(e:GetHandler(),
							effect.effect_id, runtime_context(e:GetHandler(), player))
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
function C.GetSupportedOperations()
	return { conditions=CONDITION, costs=COST, actions=ACTION, timings=NATIVE_TIMING }
end

return C

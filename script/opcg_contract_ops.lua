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
	local owner = source and source:GetControler() or Duel.GetTurnPlayer()
	local current = Duel.GetTurnPlayer()
	if duration == "UNTIL_YOUR_NEXT_TURN_START" or duration == "UNTIL_YOUR_NEXT_REFRESH" then
		return RESET_PHASE + PHASE_DRAW, current == owner and 2 or 1
	end
	if duration == "UNTIL_YOUR_NEXT_TURN_END" then
		return RESET_PHASE + PHASE_END, current == owner and 2 or 1
	end
	if duration == "UNTIL_OPPONENT_NEXT_TURN_END" then
		return RESET_PHASE + PHASE_END, current ~= owner and 1 or 2
	end
	if duration == "UNTIL_OPPONENT_NEXT_REFRESH" then
		return RESET_PHASE + PHASE_DRAW, current ~= owner and 1 or 2
	end
	return nil
end
local function attach_reset(effect, duration, source)
	local reset, count = reset_for(duration, source)
	if reset then effect:SetReset(reset, count or 1) end
	-- OPCG has no native damage phase: battle durations expire at the battle
	-- machine's END_OF_BATTLE boundary, the native reset is only a fallback.
	if duration == "THIS_BATTLE" or duration == "END_OF_BATTLE" then
		X.schedule("THIS_BATTLE_END", source, function() effect:Reset() end)
	end
end
local function single_effect(source, target, code, value, duration)
	local effect = Effect.CreateEffect(source)
	effect:SetType(EFFECT_TYPE_SINGLE)
	effect:SetCode(code)
	opcg.SetEffectValue(effect, value)
	attach_reset(effect, duration, source)
	target:RegisterEffect(effect)
	return effect
end
local function apply_selector_effect(action, context, code, value)
	local cards = choose(action.selector, context)
	for _, card in ipairs(cards) do single_effect(context.card, card, code, value, action.duration) end
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
	for _, card in ipairs(cards) do
		if opcg.IsLeader(card) or opcg.IsCharacter(card) then opcg.ReturnAttachedDon(card) end
	end
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
	-- ocgcore's MoveSequence for LOCATION_EXTRA always moves the card to the
	-- end of the list; this build treats that end as the life top.
	for _, card in ipairs(bottom_to_top or {}) do
		if card and card:IsLocation(LOCATION_EXTRA) then Duel.MoveSequence(card, 0) end
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
		else
			context.last_action_succeeded = nil
			OPCGCore.ExecuteAction(action.op, action, context)
			if context.last_action_succeeded == nil then context.last_action_succeeded = true end
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

function X.player_has(player, code, target, context)
	if not Duel.IsPlayerAffectedByEffect then return false end
	for _, effect in ipairs({Duel.IsPlayerAffectedByEffect(player, code)}) do
		local value = opcg.GetEffectValue(effect)
		if type(value) ~= "function" or value(effect, target, context) then return true end
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
	attach_reset(effect, duration, source)
	Duel.RegisterEffect(effect, source:GetControler())
	return effect
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

local function execute_restriction(op, action, context)
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
	local code = op == "CANNOT_ATTACK_TARGETS" and opcg.EFFECT_CANNOT_ATTACK_TARGETS
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

local function action_power_by_count(action, context, source_cards, destination)
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
	local amount = math.floor(#cards / (action.divisor or 1)) * (action.amount_per or 0)
	local targets = choose(action.selector, context)
	for _, card in ipairs(targets) do modify(context.card, card, EFFECT_UPDATE_ATTACK, amount, action.duration) end
	context.last_action_succeeded = #cards > 0
	return targets
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
			single_effect(context.card, card, EFFECT_DISABLE, 1, action.duration)
			single_effect(context.card, card, EFFECT_DISABLE_EFFECT, 1, action.duration)
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
		local value = sources[1] and opcg.GetBasePower(sources[1]) or 0
		local targets = choose(action.selector, context)
		for _, card in ipairs(targets) do modify(context.card, card, EFFECT_SET_BASE_ATTACK, value, action.duration) end
		return targets
	elseif op == "MODIFY_POWER_SPLIT" then
		local cards = choose(action.selector, context)
		for index, card in ipairs(cards) do
			local amount = index <= (action.primary_count or 1) and action.primary_amount or action.secondary_amount
			modify(context.card, card, EFFECT_UPDATE_ATTACK, amount or 0, action.duration)
		end
		return cards
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
		context.last_action_succeeded = true
		return remember(context, cards)
	elseif op == "TRASH_FACEUP_LIFE_ALL" then
		local cards = {}
		for _, card in ipairs(life_cards(player)) do
			if card:IsPosition(POS_FACEUP) then cards[#cards + 1] = card end
		end
		if #cards > 0 then Duel.SendtoGrave(to_group(cards), REASON_EFFECT) end
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
		local top = Duel.GetDecktopGroup(action.reveal_player == "OPPONENT" and other(player) or player, 1)
		if top:GetCount() == 0 then context.last_action_succeeded = false return {} end
		Duel.ConfirmCards(player, top)
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
			for index, item in ipairs(available) do
				descriptions[index] = aux.Stringid(context.card:GetOriginalCode(), item.index - 1)
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
		end, "TRASH")
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
		local maximum = action.count or 1
		if action.mode == "UP_TO" then
			local available_don = op == "REST_CARD_OR_DON" and opcg.ActiveDon(player) or opcg.RestedDon(player)
			local available_cards = action.card_selector and (action.card_selector.count or 1) or 0
			maximum = math.min(maximum, available_don + available_cards)
		end
		local amount = choose_number_up_to(chooser, maximum, action.mode)
		if amount == 0 then context.last_action_succeeded = action.mode == "UP_TO" return {} end
		local card_action = {
			selector=action.card_selector, player=action.player,
			duration=action.duration,
		}
		if card_action.selector then
			card_action.selector = {}
			for key, value in pairs(action.card_selector) do card_action.selector[key] = value end
			card_action.selector.count = math.min(card_action.selector.count or amount, amount)
		end
		local cards = {}
		if card_action.selector then cards = choose(card_action.selector, context) end
		for _, card in ipairs(cards) do
			if op == "REST_CARD_OR_DON" then opcg.SetRested(card) else opcg.SetActive(card) end
		end
		local remaining = math.max(0, amount - #cards)
		local moved_don
		if op == "REST_CARD_OR_DON" then moved_don = opcg.RestDon(player, remaining)
		else moved_don = opcg.SetDonActive(player, remaining) end
		context.last_action_succeeded = #cards + moved_don > 0 or action.mode == "UP_TO"
		return cards
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
		if cards[1] and context.battle then
			context.battle.target = cards[1]
			context.battle.target_field_id = cards[1]:GetFieldID()
			context.battle_target = cards[1]
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
			function(_, card) return card ~= nil and predicate(card) end, action.duration)
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
				single_effect(context.card, card, opcg.EFFECT_CANNOT_SET_DON_ACTIVE, 1, action.duration)
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
		local cards = action.card_selector and choose(action.card_selector, context) or {}
		for _, card in ipairs(cards) do
			single_effect(context.card, card, opcg.EFFECT_CANNOT_SET_ACTIVE, 1, action.duration)
		end
		if #cards < (action.count or 1) then
			local group = opcg.GetFieldDonGroup(player, action.don_state or "RESTED")
			local selected = group:GetCount() > 0 and group:Select(chooser, 0, 1, nil)
				or Group.CreateGroup()
			for don in aux.Next(selected) do
				single_effect(context.card, don, opcg.EFFECT_CANNOT_SET_DON_ACTIVE, 1, action.duration)
				cards[#cards + 1] = don
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
local continuous_card_code = {
	CANNOT_ATTACK=EFFECT_CANNOT_ATTACK,
	ALLOW_ATTACK_ACTIVE_CHARACTER=opcg.EFFECT_ALLOW_ATTACK_ACTIVE_CHARACTER,
	ALLOW_ATTACK_CHARACTER=opcg.EFFECT_ALLOW_ATTACK_CHARACTER,
	CANNOT_ATTACK_LEADER=opcg.EFFECT_CANNOT_ATTACK_LEADER,
	CANNOT_ATTACK_TARGETS=opcg.EFFECT_CANNOT_ATTACK_TARGETS,
	CANNOT_SET_ACTIVE=opcg.EFFECT_CANNOT_SET_ACTIVE,
	CANNOT_BE_RESTED=opcg.EFFECT_CANNOT_BE_RESTED,
	PREVENT_BLOCKER_ACTIVATION=opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION,
	ADD_NAME_ALIAS=opcg.EFFECT_NAME_ALIAS,
	CANNOT_LEAVE_FIELD=opcg.EFFECT_CANNOT_LEAVE_FIELD,
	REPLACE_KO=opcg.EFFECT_REPLACE_KO,
	REPLACE_LEAVE_FIELD=opcg.EFFECT_REPLACE_LEAVE,
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
	local code = continuous_card_code[op]
	if code then
		local value = op == "ADD_NAME_ALIAS" and action.name
			or (op == "CANNOT_LEAVE_FIELD" or op == "REPLACE_KO"
				or op == "REPLACE_LEAVE_FIELD" or op == "REPLACE_REST") and action
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
		local predicate = filter_for(action.filter, {card=card, player=card:GetControler()})
		local combined = function()
			return condition() and conditions_match(action.conditions, {
				card=card, player=card:GetControler(),
			})
		end
		local native = Effect.CreateEffect(card)
		native:SetType(EFFECT_TYPE_FIELD)
		native:SetCode(EFFECT_UPDATE_LEVEL)
		native:SetRange(source_range(card))
		native:SetTargetRange(LOCATION_HAND, 0)
		native:SetCondition(combined)
		native:SetTarget(function(_, target) return predicate(target) end)
		native:SetValue(action.amount or 0)
		card:RegisterEffect(native)
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
		local predicate = filter_for(action.filter, {card=card, player=card:GetControler()})
		return continuous_player_effect(card, action, opcg.EFFECT_CANNOT_PLAY,
			function(_, target) return target ~= nil and predicate(target) end, condition)
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
	local opponent = context and (context.reason_player or context.effect_player)
		and (context.reason_player or context.effect_player) ~= card:GetControler()
	if wanted == "BATTLE" then return battle end
	if wanted == "EFFECT" then return effect end
	if wanted == "OPPONENT_EFFECT" then return effect and opponent end
	if wanted == "KO_OR_OPPONENT_EFFECT" then return (ko and destroyed) or (effect and opponent) end
	if wanted == "OPPONENT_CHARACTER_EFFECT" then
		return effect and opponent and context and context.reason_card
			and opcg.IsCharacter(context.reason_card)
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
	if action.optional and Duel.SelectYesNo
		and not Duel.SelectYesNo(context.player, aux.Stringid(context.card:GetOriginalCode(), 0)) then
		return false
	end
	for _, cost in ipairs(action.replacement_costs or {}) do
		OPCGCore.PayCost(cost.op, cost, context)
	end
	execute_nested(action.replacement_actions, context)
	mark_replacement_used(action, context)
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
		if not blocked then
			local ko = destination == "TRASH" and (reason & REASON_DESTROY) ~= 0
			local codes = ko and {opcg.EFFECT_REPLACE_KO, opcg.EFFECT_REPLACE_LEAVE}
				or {opcg.EFFECT_REPLACE_LEAVE}
			for _, code in ipairs(codes) do
				for _, action in ipairs(card_effect_values(card, code)) do
					local local_context = copy_context(context, card)
					if type(action) == "table" and reason_matches(action, card, reason, context, ko)
						and replacement_available(action, local_context)
						and apply_replacement(action, local_context) then
						blocked = true
						break
					end
				end
				if blocked then break end
			end
		end
		if not blocked then kept[#kept + 1] = card end
	end
	return kept
end
function X.before_rest(card, context)
	for _, action in ipairs(card_effect_values(card, opcg.EFFECT_REPLACE_REST)) do
		local local_context = copy_context(context, card)
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
	if opcg.effect_queue and opcg.effect_queue.resolve_timing then
		return opcg.effect_queue.resolve_timing(candidates, timing, context)
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
				if destroyed then X.emit("ON_KO_BY_OPPONENT_EFFECT", event, owner, {card}) end
			else
				X.emit("ON_OWN_TRAIT_CHARACTER_LEFT_BY_EFFECT", event, owner)
			end
			if destination == "HAND" and source_player ~= nil and source_player ~= owner then
				X.emit("ON_OPPONENT_CHARACTER_RETURNED_TO_HAND_BY_OWN_EFFECT",
					event, source_player)
			end
		end
		if destroyed and opcg.IsCharacter(card) and opcg.GetBasePower(card) >= 6000 then
			X.emit("ON_DAMAGE_OR_HIGH_POWER_CHARACTER_KO", event, owner)
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


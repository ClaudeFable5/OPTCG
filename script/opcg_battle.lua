-- UI-independent OPCG battle controller.
--
-- The stock client may expose this through a temporary ignition command; a
-- later dedicated Main action bar can call the same resolve_attack function.
opcg = opcg or {}
opcg.battle = opcg.battle or {}

local B = opcg.battle

B.STAGE = {
	DECLARE="DECLARE",
	ATTACK_EFFECTS="ATTACK_EFFECTS",
	BLOCK="BLOCK",
	COUNTER="COUNTER",
	DAMAGE="DAMAGE",
	END_BATTLE="END_BATTLE",
}
B._registered = B._registered or setmetatable({}, {__mode="k"})
-- Prompt strings live on the DON cost host's cdb text entries (aux.Stringid =
-- code<<20|n -> texts.str(n+1) of card 879999999), so no !system id collisions.
B.BLOCK_PROMPT = B.BLOCK_PROMPT or aux.Stringid(879999999, 0)
B.COUNTER_PROMPT = B.COUNTER_PROMPT or aux.Stringid(879999999, 1)
B.BLOCK_SELECT_HINT = B.BLOCK_SELECT_HINT or aux.Stringid(879999999, 2)
B.COUNTER_SELECT_HINT = B.COUNTER_SELECT_HINT or aux.Stringid(879999999, 3)
B.PROMPT = B.PROMPT or B.COUNTER_PROMPT

local function copy(value)
	local result = {}
	for key, item in pairs(value or {}) do result[key] = item end
	return result
end

local function each(cards, callback)
	if not cards then return end
	if cards.GetFirst then
		local card = cards:GetFirst()
		while card do
			callback(card)
			card = cards:GetNext()
		end
		return
	end
	for _, card in ipairs(cards) do callback(card) end
end

local function array(cards)
	local result = {}
	each(cards, function(card) result[#result + 1] = card end)
	return result
end

local function to_group(cards)
	local group = Group.CreateGroup()
	for _, card in ipairs(cards) do group:AddCard(card) end
	return group
end

local function sort_field_cards(cards)
	table.sort(cards, function(left, right)
		local ll = left.GetLocation and left:GetLocation() or 0
		local rl = right.GetLocation and right:GetLocation() or 0
		if ll ~= rl then return ll < rl end
		local ls = left.GetSequence and left:GetSequence() or 0
		local rs = right.GetSequence and right:GetSequence() or 0
		return ls < rs
	end)
	return cards
end

local function default_field_cards(player)
	local group = Duel.GetMatchingGroup(function(card)
		return opcg.IsLeader(card) or opcg.IsCharacter(card) or opcg.IsStage(card)
	end, player, LOCATION_MZONE + LOCATION_FZONE, 0, nil)
	return sort_field_cards(array(group))
end

local function default_dispatch(cards, timing, context)
	if opcg.effect_queue and opcg.effect_queue.resolve_timing then
		return opcg.effect_queue.resolve_timing(cards, timing, context, {
			choose_item=context.choose_effect_order,
			choose_optional=context.choose_optional_effect,
		})
	end
	local results = {}
	each(cards, function(card)
		if OPCGCore and OPCGCore.DispatchTiming then
			results[#results + 1] = OPCGCore.DispatchTiming(card, timing, context)
		end
	end)
	return {}, results
end

local function default_bridge()
	return {
		turn_player=function() return Duel.GetTurnPlayer() end,
		personal_turn_count=function(player) return Duel.GetTurnCount(player) end,
		global_turn_count=function() return Duel.GetTurnCount() end,
		controller=function(card) return card:GetControler() end,
		field_id=function(card) return card:GetFieldID() end,
		is_active=function(card) return opcg.IsActive(card) end,
		is_on_field=function(card) return opcg.IsOnField(card) end,
		is_leader=function(card) return opcg.IsLeader(card) end,
		is_character=function(card) return opcg.IsCharacter(card) end,
		is_event=function(card) return opcg.IsEvent(card) end,
		has_keyword=function(card, keyword) return opcg.HasKeyword(card, keyword) end,
		set_rested=function(card) return opcg.SetRested(card) end,
		power=function(card) return opcg.GetPower(card) end,
		counter=function(card) return opcg.GetCounter(card) end,
		-- resolve_counters only offers [Counter] events when the bridge says so;
		-- affordability of the card's DON cost is part of that answer.
		is_event=function(card)
			return opcg.IsEvent(card)
				and opcg.CanRestDon(card:GetControler(), opcg.GetCost(card))
		end,
		field_cards=default_field_cards,
		hand_cards=function(player)
			return array(Duel.GetFieldGroup(player, LOCATION_HAND, 0))
		end,
		emit_attack=function(attacker, target)
			if Duel.OPCGAttack then return Duel.OPCGAttack(attacker, target) end
			return true
		end,
		dispatch=default_dispatch,
		select_blocker=function(player, candidates)
			if #candidates == 0 or not Duel.SelectYesNo(player, B.BLOCK_PROMPT) then return nil end
			Duel.Hint(HINT_SELECTMSG, player, B.BLOCK_SELECT_HINT)
			return to_group(candidates):Select(player, 1, 1, nil):GetFirst()
		end,
		select_counter=function(player, candidates)
			if #candidates == 0 or not Duel.SelectYesNo(player, B.COUNTER_PROMPT) then return nil end
			Duel.Hint(HINT_SELECTMSG, player, B.COUNTER_SELECT_HINT)
			return to_group(candidates):Select(player, 1, 1, nil):GetFirst()
		end,
		trash_counter=function(card)
			return Duel.SendtoGrave(card, REASON_COST)
		end,
		has_timing=function(card, timing, context)
			return opcg.effect_queue and opcg.effect_queue.has_timing
				and opcg.effect_queue.has_timing(card, timing, context)
		end,
		resolve_event_counter=function(card, state, context)
			local counter_context = copy(context)
			counter_context.card = card
			counter_context.player = state.defending_player
			counter_context.battle = state
			counter_context.event_target = card
			counter_context.event_targets = {card}
			counter_context.event_cards = {card}
			counter_context.event_count = 1
			counter_context.event_player = state.defending_player
			counter_context.effect_play = true
			if opcg.contract_ops then
				opcg.contract_ops.emit("ON_YOUR_EVENT_ACTIVATED", counter_context, state.defending_player)
				opcg.contract_ops.emit("ON_OPPONENT_EVENT_ACTIVATED", counter_context, state.attacking_player)
				opcg.contract_ops.emit("ON_OPPONENT_EVENT_OR_TRIGGER_ACTIVATED", counter_context, state.attacking_player)
				opcg.contract_ops.emit("ON_OPPONENT_BLOCKER_OR_EVENT_ACTIVATED", counter_context, state.attacking_player)
			end
			return opcg.effect_queue.resolve_timing({card}, "COUNTER", counter_context, {
				prevalidated=true,
				choose_item=context.choose_effect_order,
				choose_optional=context.choose_optional_effect,
				before_resolve=function()
					-- the event's DON cost is paid the moment it is used
					opcg.RestDon(state.defending_player, opcg.GetCost(card))
					Duel.SendtoGrave(card, REASON_RULE)
					return true
				end,
			})
		end,
		ko=function(card, state, context)
			local cards = {card}
			if opcg.contract_ops and opcg.contract_ops.before_remove then
				cards = opcg.contract_ops.before_remove(cards,
					REASON_BATTLE + REASON_DESTROY, "TRASH", context)
			end
			if #cards == 0 then return 0 end
			opcg.ReturnAttachedDon(card)
			local moved = Duel.Destroy(card, REASON_BATTLE)
			if moved > 0 and opcg.contract_ops and opcg.contract_ops.after_remove then
				opcg.contract_ops.after_remove(cards, REASON_BATTLE + REASON_DESTROY, "TRASH", context)
			end
			return moved
		end,
		damage_leader=function(player, amount, context)
			return opcg.life.damage_leader(player, amount, context)
		end,
		advance_boundary=function(context)
			if opcg.runtime and opcg.runtime.advance_boundary then
				return opcg.runtime.advance_boundary("END_OF_BATTLE", context)
			end
		end,
	}
end

local function bridge_for(context)
	return context.bridge or default_bridge()
end

local function has_matching_effect(card, code, target, context)
	return opcg.HasMatchingEffect and opcg.HasMatchingEffect(card, code, target, context)
end
local function required_attack_discard(attacker, player, context)
	if not Duel or not Duel.IsPlayerAffectedByEffect or not opcg.EFFECT_REQUIRE_ATTACK_DISCARD then return 0 end
	local required = 0
	for _, effect in ipairs({Duel.IsPlayerAffectedByEffect(player, opcg.EFFECT_REQUIRE_ATTACK_DISCARD)}) do
		local value = opcg.GetEffectValue(effect)
		if type(value) == "table" then
			local predicate = opcg.CompileFilter(value.attacker_filter or {}, context)
			if predicate and predicate(attacker) then required = math.max(required, value.count or 1) end
		elseif type(value) == "function" then
			local applies, count = value(effect, attacker, context)
			if applies then required = math.max(required, count or 1) end
		elseif value then
			required = math.max(required, 1)
		end
	end
	return required
end
local function pay_attack_discard(attacker, player, context)
	local count = required_attack_discard(attacker, player, context)
	if count <= 0 then return true end
	if not Duel.GetFieldGroup then return false end
	local hand = Duel.GetFieldGroup(player, LOCATION_HAND, 0)
	if hand:GetCount() < count then return false end
	local selected = hand:Select(player, count, count, nil)
	return Duel.SendtoGrave(selected, REASON_COST + REASON_DISCARD) == count
end
local function record_character_battle(attacker, target, bridge)
	if not attacker or not target or not bridge.is_character(target) then return end
	opcg._battle_usage = opcg._battle_usage or setmetatable({}, {__mode="k"})
	opcg._battle_usage[attacker] = {
		turn=bridge.global_turn_count(),
		opponent_character=true,
	}
end
local function played_this_turn(card, bridge)
	return bridge.field_id and card and card.GetTurnID
		and card:GetTurnID() == bridge.global_turn_count()
end
local function has_rush(card, bridge)
	return bridge.has_keyword(card, "RUSH")
end

function B.is_legal_target(target, attacking_player, attacker, context)
	if not target then return false end
	local bridge = bridge_for(context or {})
	if bridge.controller(target) == attacking_player or not bridge.is_on_field(target) then
		return false
	end
	if has_matching_effect(attacker, opcg.EFFECT_CANNOT_ATTACK_TARGETS, target, context) then
		return false
	end
	if bridge.is_leader(target) then
		if has_matching_effect(attacker, opcg.EFFECT_CANNOT_ATTACK_LEADER, target, context) then return false end
		if played_this_turn(attacker, bridge) and not bridge.is_leader(attacker)
			and not has_rush(attacker, bridge)
			and has_matching_effect(attacker, opcg.EFFECT_ALLOW_ATTACK_CHARACTER, target, context) then return false end
		return true
	end
	if bridge.is_character(target) then
		return not bridge.is_active(target)
			or has_matching_effect(attacker, opcg.EFFECT_ALLOW_ATTACK_ACTIVE_CHARACTER, target, context) == true
	end
	return false
end

function B.can_declare(attacker, context)
	context = context or {}
	if not attacker then return false, "NO_ATTACKER" end
	local bridge = bridge_for(context)
	local player = bridge.controller(attacker)
	if bridge.turn_player() ~= player then return false, "NOT_TURN_PLAYER" end
	if not bridge.is_on_field(attacker)
		or not (bridge.is_leader(attacker) or bridge.is_character(attacker)) then
		return false, "INVALID_ATTACKER"
	end
	if not bridge.is_active(attacker) then return false, "ATTACKER_RESTED" end
	if has_matching_effect(attacker, EFFECT_CANNOT_ATTACK, nil, context) then return false, "CANNOT_ATTACK" end
	if bridge.personal_turn_count(player) <= 1 then return false, "FIRST_PERSONAL_TURN" end
	local discard = required_attack_discard(attacker, player, context)
	if discard > 0 and #bridge.hand_cards(player) < discard then return false, "ATTACK_COST_UNPAYABLE" end

	if played_this_turn(attacker, bridge) and not bridge.is_leader(attacker)
		and not has_rush(attacker, bridge)
		and not has_matching_effect(attacker, opcg.EFFECT_ALLOW_ATTACK_CHARACTER, nil, context) then
		return false, "SUMMONING_SICKNESS"
	end
	return true
end

local function same_field_object(card, field_id, bridge)
	return card and bridge.is_on_field(card) and bridge.field_id(card) == field_id
end
local function blocker_candidates(state, bridge)
	if bridge.has_keyword(state.attacker, "UNBLOCKABLE") then return {} end
	local result = {}
	for _, card in ipairs(bridge.field_cards(state.defending_player)) do
		if card ~= state.original_target
			and bridge.is_character(card)
			and bridge.is_active(card)
			and bridge.has_keyword(card, "BLOCKER")
			and not has_matching_effect(state.attacker,
				opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION, card, state)
			and not has_matching_effect(card,
				opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION, state.attacker, state) then
			result[#result + 1] = card
		end
	end
	return result
end

local function resolve_counters(state, bridge, context)
	local total, used = 0, {}
	while true do
		local candidates = {}
		for _, card in ipairs(bridge.hand_cards(state.defending_player)) do
			local character_counter = (bridge.counter(card) or 0) > 0
			local event_counter = bridge.is_event and bridge.is_event(card)
				and bridge.has_timing and bridge.has_timing(card, "COUNTER", {
					card=card,
					player=state.defending_player,
					battle=state,
				})
			if character_counter or event_counter then
				candidates[#candidates + 1] = card
			end
		end
		local selected = bridge.select_counter(state.defending_player, candidates, state, context)
		if not selected then break end
		local value = math.max(0, bridge.counter(selected) or 0)
		if value > 0 then
			bridge.trash_counter(selected, state, context)
			total = total + value
			used[#used + 1] = { card=selected, value=value, kind="CHARACTER" }
		elseif bridge.resolve_event_counter then
			local enqueued, resolved = bridge.resolve_event_counter(selected, state, context)
			used[#used + 1] = {
				card=selected, value=0, kind="EVENT",
				enqueued=enqueued, resolved=resolved,
			}
		else
			break
		end
	end
	return total, used
end

function B.resolve_attack(attacker, target, context)
	context = copy(context)
	local bridge = bridge_for(context)
	context.bridge = bridge
	local ok, reason = B.can_declare(attacker, context)
	if not ok then return false, {reason=reason} end

	local attacking_player = bridge.controller(attacker)
	if not B.is_legal_target(target, attacking_player, attacker, context) then
		return false, {reason="INVALID_TARGET"}
	end

	local state = {
		stage=B.STAGE.DECLARE,
		attacker=attacker,
		attacker_field_id=bridge.field_id(attacker),
		original_target=target,
		target=target,
		target_field_id=bridge.field_id(target),
		attacking_player=attacking_player,
		defending_player=1 - attacking_player,
		counter_power=0,
		counter_cards={},
		blocker=nil,
		outcome=nil,
	}
	context.battle = state
	context.battle_attacker = attacker
	context.battle_target = target

	if not pay_attack_discard(attacker, attacking_player, context) then
		return false, {reason="ATTACK_COST_UNPAYABLE"}
	end

	bridge.set_rested(attacker)
	bridge.emit_attack(attacker, target, state, context)

	state.stage = B.STAGE.ATTACK_EFFECTS
	bridge.dispatch({attacker}, "WHEN_ATTACKING", context)
	if bridge.is_leader(target) then
		bridge.dispatch({attacker}, "WHEN_ATTACKING_OPPONENT_LEADER", context)
	end
	bridge.dispatch(bridge.field_cards(state.defending_player), "ON_OPPONENT_ATTACK", context)
	if not same_field_object(attacker, state.attacker_field_id, bridge)
		or not same_field_object(target, state.target_field_id, bridge) then
		state.outcome = "CANCELED_BEFORE_BLOCK"
		state.stage = B.STAGE.END_BATTLE
		bridge.advance_boundary(context)
		return true, state
	end

	state.stage = B.STAGE.BLOCK
	local blocker = bridge.select_blocker(state.defending_player,
		blocker_candidates(state, bridge), state, context)
	if blocker then
		state.blocker = blocker
		state.target = blocker
		state.target_field_id = bridge.field_id(blocker)
		context.battle_target = blocker
		bridge.set_rested(blocker)
		bridge.emit_attack(attacker, blocker, state, context)
		bridge.dispatch({blocker}, "ON_BLOCK", context)
		bridge.dispatch(bridge.field_cards(attacking_player),
			"ON_OPPONENT_BLOCKER_ACTIVATED", context)
		bridge.dispatch(bridge.field_cards(attacking_player),
			"ON_OPPONENT_BLOCKER_OR_EVENT_ACTIVATED", context)
	end
	bridge.dispatch({attacker, state.target}, "WHEN_ATTACKING_OR_ATTACKED", context)
	bridge.dispatch({attacker, state.target}, "WHEN_BATTLING", context)

	if not same_field_object(attacker, state.attacker_field_id, bridge)
		or not same_field_object(state.target, state.target_field_id, bridge) then
		state.outcome = "CANCELED_BEFORE_COUNTER"
		state.stage = B.STAGE.END_BATTLE
		bridge.advance_boundary(context)
		return true, state
	end

	state.stage = B.STAGE.COUNTER
	state.counter_power, state.counter_cards = resolve_counters(state, bridge, context)

	if not same_field_object(attacker, state.attacker_field_id, bridge)
		or not same_field_object(state.target, state.target_field_id, bridge) then
		state.outcome = "CANCELED_BEFORE_DAMAGE"
		state.stage = B.STAGE.END_BATTLE
		bridge.advance_boundary(context)
		return true, state
	end

	state.stage = B.STAGE.DAMAGE
	state.attacker_power = bridge.power(attacker)
	state.target_power = bridge.power(state.target) + state.counter_power
	if state.attacker_power >= state.target_power then
		if bridge.is_leader(state.target) then
			local amount = bridge.has_keyword(attacker, "DOUBLE_ATTACK") and 2 or 1
			state.damage = bridge.damage_leader(state.defending_player, amount, {
				attacking_player=attacking_player,
				attacker=attacker,
				banish=bridge.has_keyword(attacker, "BANISH"),
				battle=state,
				choose_effect_order=context.choose_effect_order,
				choose_optional_effect=context.choose_optional_effect,
			})
			state.outcome = state.damage.defeated and "DEFEAT" or "LEADER_DAMAGE"
			if state.damage.processed and state.damage.processed > 0 then
				context.damage = state.damage.processed
				bridge.dispatch(bridge.field_cards(attacking_player),
					"ON_DAMAGE_OR_HIGH_POWER_CHARACTER_KO", context)
				bridge.dispatch(bridge.field_cards(attacking_player),
					"ON_DAMAGE_TO_OPPONENT_LIFE", context)
				-- ON_YOUR/OPPONENT_LIFE_DECREASED now dispatch centrally inside
				-- opcg.life.damage_leader (so effect damage fires them too)
			end
		else
			bridge.ko(state.target, state, context)
			state.outcome = "CHARACTER_KO"
			bridge.dispatch({attacker}, "ON_BATTLE_KO", context)
			bridge.dispatch({state.target}, "ON_SELF_KO", context)
			bridge.dispatch(bridge.field_cards(attacking_player),
				"ON_OPPONENT_CHARACTER_KO", context)
			bridge.dispatch(bridge.field_cards(attacking_player), "ON_ANY_CHARACTER_KO", context)
			bridge.dispatch(bridge.field_cards(state.defending_player), "ON_ANY_CHARACTER_KO", context)
		end
	else
		state.outcome = "ATTACK_LOST"
	end

	state.stage = B.STAGE.END_BATTLE
	if bridge.is_character(state.target) then
		record_character_battle(attacker, state.target, bridge)
		bridge.dispatch({attacker, state.target}, "AFTER_BATTLE_WITH_OPPONENT_CHARACTER", context)
	end
	bridge.dispatch(bridge.field_cards(attacking_player), "END_OF_BATTLE", context)
	bridge.dispatch(bridge.field_cards(state.defending_player), "END_OF_BATTLE", context)
	bridge.advance_boundary(context)
	return true, state
end

function B.register_attack_action(card)
	if B._registered[card] then return true end
	B._registered[card] = true
	if not Effect or not Effect.CreateEffect or not card.RegisterEffect then return true end
	if not (opcg.IsLeader(card) or opcg.IsCharacter(card)) then return true end

	local attack = Effect.CreateEffect(card)
	attack:SetType(EFFECT_TYPE_IGNITION)
	attack:SetRange(LOCATION_MZONE)
	attack:SetProperty(EFFECT_FLAG_CARD_TARGET)
	attack:SetCondition(function(effect, player)
		local attacker = effect:GetHandler()
		local ok = B.can_declare(attacker)
		if not ok then return false end
		return Duel.IsExistingMatchingCard(function(target)
			return B.is_legal_target(target, player, attacker)
		end, player, 0, LOCATION_MZONE, 1, nil)
	end)
	attack:SetTarget(function(effect, player, _, _, _, _, _, _, check)
		local attacker = effect:GetHandler()
		if check == 0 then
			return Duel.IsExistingMatchingCard(function(target)
				return B.is_legal_target(target, player, attacker)
			end, player, 0, LOCATION_MZONE, 1, nil)
		end
		Duel.SetChainLimit(aux.FALSE)
		local selected = Duel.SelectMatchingCard(player, function(target)
			return B.is_legal_target(target, player, attacker)
		end, player, 0, LOCATION_MZONE, 1, 1, nil)
		Duel.SetTargetCard(selected)
	end)
	attack:SetOperation(function(effect)
		local target = Duel.GetFirstTarget()
		if target then B.resolve_attack(effect:GetHandler(), target) end
	end)
	attack:SetDescription(1157) -- [OPCG] tells the client this ignition is THE attack (dedicated button)
	card:RegisterEffect(attack)
	return true
end

return B

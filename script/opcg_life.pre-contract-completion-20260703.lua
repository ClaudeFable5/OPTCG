-- Ordered, private OPCG life processing.
--
-- LOCATION_EXTRA sequence 0 is the bottom of the life stack in this build;
-- the highest sequence is the top. A player privately checks that top card
-- before deciding whether to activate [Trigger].
opcg = opcg or {}
opcg.life = opcg.life or {}

local L = opcg.life

L.WIN_REASON = L.WIN_REASON or 0x4f504347 -- "OPCG"
-- "Activate the [Trigger]?" -- lives on the DON deck host's cdb texts (str2).
L.TRIGGER_PROMPT = L.TRIGGER_PROMPT or aux.Stringid(879999998, 1)

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

local function default_bridge()
	return {
		life_cards=function(player)
			return Duel.GetFieldGroup(player, LOCATION_EXTRA, 0)
		end,
		sequence=function(card) return card:GetSequence() end,
		has_trigger=function(card) return opcg.HasLifeTrigger(card) end,
		can_add_to_hand=function() return true end,
		confirm_private=function(player, card) Duel.ConfirmCards(player, card) end,
		choose_trigger=function(player)
			return Duel.SelectYesNo(player, L.TRIGGER_PROMPT)
		end,
		to_hand=function(player, card, reason)
			return Duel.SendtoHand(card, player, reason)
		end,
		to_trash=function(card, reason)
			return Duel.SendtoGrave(card, reason)
		end,
		to_limbo=function(player, card, reason)
			return Duel.Sendto(card, LOCATION_REMOVED, reason, POS_FACEUP, player, 0)
		end,
		is_in_limbo=function(card) return card:IsLocation(LOCATION_REMOVED) end,
		dispatch_trigger=function(card, context)
			if opcg.effect_queue and opcg.effect_queue.resolve_timing then
				return opcg.effect_queue.resolve_timing({ card }, "LIFE_TRIGGER", context)
			end
			if OPCGCore and OPCGCore.DispatchTiming then
				return OPCGCore.DispatchTiming(card, "LIFE_TRIGGER", context)
			end
			return {}
		end,
		win=function(player, reason) return Duel.Win(player, reason) end,
	}
end

local function bridge_for(context)
	return context.bridge or default_bridge()
end

function L.top(player, context)
	context = context or {}
	local bridge = bridge_for(context)
	local top, top_sequence
	each(bridge.life_cards(player), function(card)
		local sequence = bridge.sequence(card)
		if top == nil or sequence > top_sequence then
			top, top_sequence = card, sequence
		end
	end)
	return top
end

function L.damage_leader(player, amount, context)
	context = copy(context)
	context.damaged_player = player
	context.attacking_player = context.attacking_player == nil and (1 - player)
		or context.attacking_player
	amount = math.max(0, math.floor(tonumber(amount) or 0))

	local bridge = bridge_for(context)
	local reason = context.reason or REASON_BATTLE or REASON_RULE or 0
	local result = {
		player=player,
		amount=amount,
		processed=0,
		cards={},
		defeated=false,
		blocked=false,
	}

	for damage_index = 1, amount do
		local card = L.top(player, { bridge=bridge })
		if not card then
			result.defeated = true
			result.loss_at = damage_index
			bridge.win(1 - player, L.WIN_REASON)
			break
		end

		local item = { card=card, damage_index=damage_index }
		result.cards[#result.cards + 1] = item
		result.processed = result.processed + 1

		local banish = context.banish == true
		if type(context.banish) == "function" then
			banish = context.banish(card, damage_index, context) == true
		end

		if banish then
			item.destination = "TRASH"
			item.banished = true
			bridge.to_trash(card, reason)
		else
			local can_add = bridge.can_add_to_hand(card, player, context) ~= false
			if not can_add then
				item.destination = "REPLACED"
				item.replaced = true
				if bridge.replace_life then
					bridge.replace_life(card, player, context)
				else
					item.replaced = false
					result.blocked = true
					break
				end
			else
				-- MSG_CONFIRM_CARDS for an EXTRA card is routed only to this player.
				bridge.confirm_private(player, card)
				local has_trigger = bridge.has_trigger(card) == true
				local activate = has_trigger and bridge.choose_trigger(player, card, context) == true
				item.has_trigger = has_trigger
				item.triggered = activate

				if activate then
					-- A Trigger card belongs to no area while resolving. REMOVED is
					-- the reserved synchronized limbo for that state.
					item.destination = "TRIGGER"
					bridge.to_limbo(player, card, reason)
					local trigger_context = copy(context)
					trigger_context.card = card
					trigger_context.player = player
					trigger_context.damage_index = damage_index
					trigger_context.life_card = card
					bridge.dispatch_trigger(card, trigger_context)
					if bridge.is_in_limbo(card) then
						item.destination = "TRASH"
						bridge.to_trash(card, reason)
					else
						item.destination = "EFFECT"
					end
				else
					item.destination = "HAND"
					bridge.to_hand(player, card, reason)
				end
			end
		end
	end

	return result
end

return L

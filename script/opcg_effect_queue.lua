-- ONE PIECE CARD GAME auto-effect queue.
--
-- EDOPro normally builds a YGO chain and resolves it backwards. OPCG instead
-- resolves one auto effect at a time. Effects whose timing is fulfilled
-- together are grouped by generation: the turn player's generation resolves
-- first, then the non-turn player's. Effects produced while resolving an item
-- are placed in the next generation.
--
-- This is a modernized, scoped successor to the 2021 VanguardEventTable
-- prototype in legacy.txt. It deliberately does not monkey-patch
-- Card.RegisterEffect.
opcg = opcg or {}
opcg.effect_queue = opcg.effect_queue or {}

local Q = opcg.effect_queue

Q.EVENT_RESOLVE = Q.EVENT_RESOLVE or ((EVENT_CUSTOM or 0x10000000) + 0x0f101)
Q._items = Q._items or {}
Q._serial = Q._serial or 0
Q._installed = Q._installed or false
Q._flushing = false
Q._active_item = nil
Q._last_generation = Q._last_generation or 0
Q._inflight = Q._inflight or nil
Q._resolvers = Q._resolvers or setmetatable({}, {__mode = "k"})
Q._direct_items = Q._direct_items or {}
Q._direct_serial = Q._direct_serial or 0
Q._direct_active = nil
Q._direct_draining = false

local function turn_player()
	if Duel and Duel.GetTurnPlayer then return Duel.GetTurnPlayer() end
	return 0
end

local function current_chain()
	if Duel and Duel.GetCurrentChain then return Duel.GetCurrentChain() end
	return 0
end

local function shallow_copy(value)
	local result = {}
	for key, item in pairs(value or {}) do result[key] = item end
	return result
end

local function clone_event_group(group)
	if group and group.Clone then return group:Clone() end
	return group
end

local function find_index(serial, resolver)
	for index, item in ipairs(Q._items) do
		if item.serial == serial and (resolver == nil or item.resolver == resolver) then
			return index, item
		end
	end
	return nil, nil
end

local function minimum_generation()
	local result
	for _, item in ipairs(Q._items) do
		if result == nil or item.generation < result then result = item.generation end
	end
	return result
end

local function generation_has_player(generation, player)
	for _, item in ipairs(Q._items) do
		if item.generation == generation and item.player == player then return true end
	end
	return false
end

local function eligible_bucket()
	local generation = minimum_generation()
	if generation == nil then return nil, nil end
	local tp = turn_player()
	if generation_has_player(generation, tp) then return generation, tp end
	return generation, 1 - tp
end

local function description_for(card, effect, index)
	if type(effect.description) == "number" then return effect.description end
	-- EDOPro system string 222: "Activate a Trigger Effect?"
	return 222
end

local function source_says_optional(source)
	source = source or ""
	for _, marker in ipairs({
		"may ", "can ", "you may", "you can",
		"できる", "してもよい", "할 수", "해도 된다", "수 있다",
	}) do
		if source:find(marker, 1, true) then return true end
	end
	return false
end

function Q.is_optional(effect)
	if effect.optional ~= nil then return effect.optional == true end
	if effect.mandatory ~= nil then return effect.mandatory ~= true end
	-- An activation cost can always be declined by choosing not to pay it.
	if #(effect.costs or {}) > 0 then return true end
	return source_says_optional(effect.source_text)
end

function Q.pending_count()
	return #Q._items
end

function Q.snapshot()
	local result = {}
	for _, item in ipairs(Q._items) do
		result[#result + 1] = {
			serial=item.serial,
			player=item.player,
			generation=item.generation,
			effect_id=item.effect and item.effect.effect_id,
			raised=item.raised,
		}
	end
	return result
end

function Q.reset()
	Q._items = {}
	Q._serial = 0
	Q._flushing = false
	Q._active_item = nil
	Q._inflight = nil
	Q._last_generation = 0
	Q._direct_items = {}
	Q._direct_serial = 0
	Q._direct_active = nil
	Q._direct_draining = false
end

function Q.enqueue(card, effect, resolver, context, options)
	options = options or {}
	context = shallow_copy(context)
	if options.timing ~= nil then context.timing = options.timing end
	Q._serial = Q._serial + 1
	local generation
	if Q._active_item then
		generation = Q._active_item.generation + 1
	elseif #Q._items == 0 then
		generation = 0
	else
		generation = minimum_generation() or Q._last_generation
	end
	local item = {
		serial=Q._serial,
		card=card,
		effect=effect,
		resolver=resolver,
		player=context.player == nil and card:GetControler() or context.player,
		generation=generation,
		context=context,
		optional=options.optional == nil and Q.is_optional(effect) or options.optional,
		description=options.description or 0,
		raised=false,
	}
	Q._items[#Q._items + 1] = item
	return item
end

function Q.take(serial, resolver)
	local index, item = find_index(serial, resolver)
	if not index then return nil end
	table.remove(Q._items, index)
	if Q._inflight == serial then
		Q._inflight = nil
	end
	return item
end

function Q.flush()
	if Q._flushing or #Q._items == 0 or current_chain() > 0 then return false end
	if Q._inflight ~= nil then return false end
	local generation, player = eligible_bucket()
	if generation == nil then return false end
	Q._flushing = true
	local selected
	for _, item in ipairs(Q._items) do
		if item.generation == generation and item.player == player and not item.raised then
			selected = item
			break
		end
	end
	if selected then
		selected.raised = true
		Q._inflight = selected.serial
		if Duel and Duel.RaiseSingleEvent then
			Duel.RaiseSingleEvent(selected.card, Q.EVENT_RESOLVE, selected.resolver,
				0, player, player, selected.serial)
		end
	end
	Q._flushing = false
	return selected ~= nil
end

function Q.after_chain()
	for _, item in ipairs(Q._items) do item.raised = false end
	Q.flush()
end

function Q.install()
	if Q._installed then return true end
	Q._installed = true
	if not Effect or not Effect.GlobalEffect or not Duel or not Duel.RegisterEffect then
		return true
	end
	local watcher = Effect.GlobalEffect()
	watcher:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
	watcher:SetCode(EVENT_CHAIN_END)
	watcher:SetOperation(function() Q.after_chain() end)
	Duel.RegisterEffect(watcher, 0)
	return true
end

local function make_context(card, tp, eg, ep, ev, re, r, rp)
	local context = {
		card=card,
		player=card:GetControler(),
		turn_id=Duel.GetTurnCount and Duel.GetTurnCount() or 0,
		event_group=clone_event_group(eg),
		event_player=ep,
		event_value=ev,
		reason_effect=re,
		reason=r,
		reason_player=rp,
		collecting_player=tp,
	}
	if context.event_group and context.event_group.GetFirst then
		context.event_target = context.event_group:GetFirst()
	end
	return context
end

function Q.register_trigger(card, effect, code, options)
	options = options or {}
	Q.install()

	local resolver = Effect.CreateEffect(card)
	resolver:SetType(EFFECT_TYPE_SINGLE + EFFECT_TYPE_TRIGGER_F)
	resolver:SetCode(Q.EVENT_RESOLVE)
	resolver:SetProperty(EFFECT_FLAG_DELAY)
	local description = description_for(card, effect, options.description_index)
	if description ~= 0 then resolver:SetDescription(description) end
	resolver:SetCondition(function(e, _, _, _, ev, re)
		local _, item = find_index(ev, e)
		return re == e and item ~= nil
	end)
	resolver:SetTarget(function(e, _, _, _, ev, _, _, _, check)
		if check == 0 then
			local _, item = find_index(ev, e)
			return item ~= nil
		end
		-- One OPCG effect resolves before the next effect may activate.
		Duel.SetChainLimit(aux.FALSE)
	end)
	resolver:SetOperation(function(e, player, _, _, ev)
		local item = Q.take(ev, e)
		if not item then return end
		Q._last_generation = item.generation
		local previous = Q._active_item
		Q._active_item = item
		local context = item.context
		context.player = item.player
		context.timing = context.timing or item.timing
		local can_resolve = opcg.runtime.can_resolve(item.card,
			item.effect.effect_id, context)
		local accepted = can_resolve
		if accepted and item.optional then
			accepted = Duel.SelectYesNo(player, item.description)
		end
		if accepted then
			opcg.runtime.resolve(item.card, item.effect.effect_id, context)
		end
		Q._active_item = previous
	end)
	Q._resolvers[resolver] = true
	card:RegisterEffect(resolver)

	local collector = Effect.CreateEffect(card)
	local field = options.field == true
	collector:SetType((field and EFFECT_TYPE_FIELD or EFFECT_TYPE_SINGLE)
		+ EFFECT_TYPE_CONTINUOUS)
	collector:SetCode(code)
	if options.range then collector:SetRange(options.range) end
	if options.target_range then
		collector:SetTargetRange(options.target_range[1], options.target_range[2])
	end
	if options.condition then collector:SetCondition(options.condition) end
	if options.target then collector:SetTarget(options.target) end
	collector:SetOperation(function(e, tp, eg, ep, ev, re, r, rp)
		local handler = e:GetHandler()
		local context = make_context(handler, tp, eg, ep, ev, re, r, rp)
		if options.context then
			context = options.context(e, tp, eg, ep, ev, re, r, rp, context) or context
		end
		if options.timing ~= nil then context.timing = options.timing end
		local ok = opcg.runtime.can_resolve(handler, effect.effect_id, context)
		if not ok then return end
		Q.enqueue(handler, effect, resolver, context, {
			optional=options.optional,
			description=description,
			timing=options.timing,
		})
		Q.flush()
	end)
	card:RegisterEffect(collector)
	return collector, resolver
end

local function timing_matches(effect, timing)
	for _, value in ipairs(effect.timings or {}) do
		if value == timing then return true end
	end
	return false
end

local function each_card(cards, callback)
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

local function direct_minimum_generation()
	local result
	for _, item in ipairs(Q._direct_items) do
		if result == nil or item.generation < result then result = item.generation end
	end
	return result
end

local function direct_bucket()
	local generation = direct_minimum_generation()
	if generation == nil then return nil, nil, {} end
	local tp = turn_player()
	local player = 1 - tp
	for _, item in ipairs(Q._direct_items) do
		if item.generation == generation and item.player == tp then
			player = tp
			break
		end
	end
	local result = {}
	for _, item in ipairs(Q._direct_items) do
		if item.generation == generation and item.player == player then
			result[#result + 1] = item
		end
	end
	return generation, player, result
end

local function remove_direct(item)
	for index, candidate in ipairs(Q._direct_items) do
		if candidate == item then
			table.remove(Q._direct_items, index)
			return true
		end
	end
	return false
end

function Q.has_timing(card, timing, context)
	if not opcg.runtime or not opcg.runtime.get_definition then return false end
	local definition = opcg.runtime.get_definition(card)
	if not definition then return false end
	for _, effect in ipairs(definition.effects or {}) do
		if timing_matches(effect, timing) then
			local item_context = shallow_copy(context)
			item_context.card = card
			item_context.player = item_context.player == nil and card:GetControler()
				or item_context.player
			item_context.timing = timing
			if opcg.runtime.can_resolve(card, effect.effect_id, item_context) then
				return true
			end
		end
	end
	return false
end

function Q.direct_pending_count()
	return #Q._direct_items
end

function Q.enqueue_timing(cards, timing, context)
	context = context or {}
	local enqueued = {}

	each_card(cards, function(card)
		local definition = opcg.runtime and opcg.runtime.get_definition
			and opcg.runtime.get_definition(card)
		if not definition then return end
		for _, effect in ipairs(definition.effects or {}) do
			if timing_matches(effect, timing) then
				local item_context = shallow_copy(context)
				item_context.card = card
				item_context.player = card:GetControler()
				item_context.timing = timing
				if opcg.runtime.can_resolve(card, effect.effect_id, item_context) then
					Q._direct_serial = Q._direct_serial + 1
					local generation = Q._direct_active
						and (Q._direct_active.generation + 1) or 0
					local item = {
						serial=Q._direct_serial,
						card=card,
						effect=effect,
						player=item_context.player,
						generation=generation,
						context=item_context,
						optional=Q.is_optional(effect),
						description=description_for(card, effect, 0),
						timing=timing,
					}
					Q._direct_items[#Q._direct_items + 1] = item
					enqueued[#enqueued + 1] = item
				end
			end
		end
	end)

	return enqueued
end

function Q.drain_direct(options, timing, context)
	options = options or {}
	context = context or {}
	if Q._direct_draining then return {} end
	Q._direct_draining = true
	local resolved = {}

	while #Q._direct_items > 0 do
		local _, player, candidates = direct_bucket()
		if #candidates == 0 then break end
		local selected = candidates[1]
		if options.choose_item then
			local choice = options.choose_item(player, candidates, timing, context)
			if type(choice) == "number" then selected = candidates[choice] or selected
			elseif choice then selected = choice end
		end
		remove_direct(selected)
		selected.context.timing = selected.context.timing or selected.timing

		local accepted = opcg.runtime.can_resolve(selected.card,
			selected.effect.effect_id, selected.context)
		if accepted and selected.optional then
			if options.choose_optional then
				accepted = options.choose_optional(player, selected) == true
			elseif Duel and Duel.SelectYesNo then
				accepted = Duel.SelectYesNo(player, selected.description)
			end
		end

		local record = {
			serial=selected.serial,
			card=selected.card,
			effect_id=selected.effect.effect_id,
			player=selected.player,
			generation=selected.generation,
			accepted=accepted == true,
			timing=selected.timing,
		}
		resolved[#resolved + 1] = record
		if accepted then
			if options.before_resolve
				and options.before_resolve(player, selected, selected.context or context) == false then
				accepted = false
				record.accepted = false
				record.reason = "ACTIVATION_ABORTED"
			end
		end
		if accepted then
			local previous = Q._direct_active
			Q._direct_active = selected
			if options.prevalidated and opcg.runtime.resolve_prevalidated then
				record.ok, record.result = opcg.runtime.resolve_prevalidated(
					selected.card, selected.effect.effect_id, selected.context)
			else
				record.ok, record.result = opcg.runtime.resolve(selected.card,
					selected.effect.effect_id, selected.context)
			end
			Q._direct_active = previous
		end
	end

	Q._direct_draining = false
	return resolved
end

function Q.resolve_timing(cards, timing, context, options)
	context = context or {}
	options = options or {}
	local enqueued = Q.enqueue_timing(cards, timing, context)
	if options.defer or Q._direct_draining then return enqueued, {} end
	local resolved = Q.drain_direct(options, timing, context)
	return enqueued, resolved
end

return Q

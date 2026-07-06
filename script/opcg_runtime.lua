opcg = opcg or {}
opcg.runtime = opcg.runtime or {}

local runtime = opcg.runtime
runtime._definitions = runtime._definitions or setmetatable({}, {__mode = "k"})
runtime._review_definitions = runtime._review_definitions or setmetatable({}, {__mode = "k"})
runtime._once_usage = runtime._once_usage or setmetatable({}, {__mode = "k"})
runtime.adapter = runtime.adapter or nil

local function assert_array(value, label)
    assert(type(value) == "table", label .. " must be a table")
end

local function find_effect(definition, effect_id)
    for _, effect in ipairs(definition.effects) do
        if effect.effect_id == effect_id then return effect end
    end
    return nil
end

local function has_timing(effect, timing)
    for _, value in ipairs(effect.timings) do
        if value == timing then return true end
    end
    return false
end

local function effect_for_timing(effect, timing)
    if has_timing(effect, timing) then return effect end
    local actions = {}
    for _, action in ipairs(effect.actions or {}) do
        if action.timing == timing then actions[#actions + 1] = action end
    end
    if #actions == 0 then return nil end
    local filtered = {}
    for key, value in pairs(effect) do filtered[key] = value end
    filtered.actions = actions
    return filtered
end

local function once_key(effect, context)
    local turn_id = context.turn_id
    if turn_id == nil and Duel and Duel.GetTurnCount then turn_id = Duel.GetTurnCount() end
    return table.concat({
        tostring(effect.effect_id),
        tostring(context.player or "YOU"),
        tostring(turn_id or 0),
    }, ":")
end

function runtime.bind(adapter)
    assert(type(adapter) == "table", "OPCG runtime adapter must be a table")
    for _, method in ipairs({"check_condition", "can_pay_cost", "pay_cost", "execute_action"}) do
        assert(type(adapter[method]) == "function", "OPCG adapter is missing " .. method)
    end
    runtime.adapter = adapter
    return runtime
end

function runtime.register_card(card, definition)
    assert(card ~= nil, "card is required")
    runtime._definitions[card] = definition
    runtime._review_definitions[card] = nil
    if runtime.adapter and runtime.adapter.register_card then
        runtime.adapter:register_card(card, definition)
    end
    return definition
end

function runtime.register_review_card(card, definition)
    assert(card ~= nil, "card is required")
    runtime._review_definitions[card] = definition
    runtime._definitions[card] = nil
    if runtime.adapter and runtime.adapter.register_review_card then
        runtime.adapter:register_review_card(card, definition)
    end
    return definition
end

function runtime.get_definition(card)
    return runtime._definitions[card], runtime._review_definitions[card]
end

function runtime.is_quarantined(card)
    return runtime._review_definitions[card] ~= nil
end

function runtime.can_resolve(card, effect_id, context)
    local definition = runtime._definitions[card]
    if not definition then
        if runtime._review_definitions[card] then return false, "REVIEW_QUARANTINED" end
        return false, "UNREGISTERED_CARD"
    end
    local effect = find_effect(definition, effect_id)
    if not effect then return false, "UNKNOWN_EFFECT" end
    if card.IsDisabled and card:IsDisabled() then
        return false, "EFFECT_NEGATED"
    end
    local adapter = assert(runtime.adapter, "OPCG runtime adapter is not bound")
    -- fail-closed: the effect_queue reaches effects straight from the IR, so
    -- the shape gate must sit here too -- otherwise an unsupported action pays
    -- its costs before erroring out.
    if adapter.effect_supported and not adapter:effect_supported(effect, card) then
        return false, "UNSUPPORTED_SHAPE"
    end
    context = context or {}
    context.card = context.card or card
    context.definition = definition
    context.effect = effect
    if context.timing and opcg.contract_ops and opcg.contract_ops.timing_negated
        and opcg.contract_ops.timing_negated(card, context.timing, context) then
        return false, "TIMING_NEGATED"
    end

    if effect.don_attached and adapter.get_attached_don
        and adapter:get_attached_don(card, context) < effect.don_attached then
        return false, "INSUFFICIENT_ATTACHED_DON"
    end
    if effect.once_per_turn then
        local usage = runtime._once_usage[card]
        if usage and usage[once_key(effect, context)] then return false, "ONCE_PER_TURN_USED" end
    end
    for _, condition in ipairs(effect.conditions) do
        if not adapter:check_condition(condition, context) then return false, "CONDITION_FAILED" end
    end
    for _, cost in ipairs(effect.costs) do
        if not adapter:can_pay_cost(cost, context) then return false, "COST_UNPAYABLE" end
    end
    return true, effect
end

local function resolve_effect(card, effect, context)
    local adapter = runtime.adapter
    local success, result = pcall(function()
        for _, cost in ipairs(effect.costs) do adapter:pay_cost(cost, context) end
        -- OPCG costs are paid before the effect resolves and are never rolled back merely
        -- because a later action can no longer change the state.
        if effect.once_per_turn then
            local usage = runtime._once_usage[card] or {}
            usage[once_key(effect, context)] = true
            runtime._once_usage[card] = usage
        end
        local action_results = {}
        local previous_action_succeeded = true
        for index, action in ipairs(effect.actions) do
            if action["then"] == true and previous_action_succeeded ~= true then
                action_results[index] = {}
                context.last_action_result = action_results[index]
                context.last_action_succeeded = false
            else
                context.last_action_succeeded = nil
                action_results[index] = adapter:execute_action(action, context)
                context.last_action_result = action_results[index]
                if type(action_results[index]) == "table" and #action_results[index] > 0 then
                    context.last_targets = action_results[index]
                    context.last_target = action_results[index][1]
                end
                if context.last_action_succeeded == nil then context.last_action_succeeded = true end
            end
            previous_action_succeeded = context.last_action_succeeded == true
        end
        return action_results
    end)

    if not success then return false, result end
    return true, result
end

function runtime.resolve(card, effect_id, context)
    context = context or {}
    local ok, effect_or_reason = runtime.can_resolve(card, effect_id, context)
    if not ok then return false, effect_or_reason end
    return resolve_effect(card, effect_or_reason, context)
end

-- Used when an activation rule moves the source card before its already
-- validated effect resolves, such as an OPCG Event [Counter] being trashed at
-- activation. Callers must run can_resolve immediately before this function.
function runtime.resolve_prevalidated(card, effect_id, context)
    context = context or {}
    local definition = runtime._definitions[card]
    if not definition then return false, "UNREGISTERED_CARD" end
    local effect = find_effect(definition, effect_id)
    if not effect then return false, "UNKNOWN_EFFECT" end
    context.card = context.card or card
    context.definition = definition
    context.effect = effect
    return resolve_effect(card, effect, context)
end

function runtime.dispatch(card, timing, context)
    context = context or {}
    context.timing = timing
    local definition = runtime._definitions[card]
    if not definition then
        if runtime._review_definitions[card] then return {}, "REVIEW_QUARANTINED" end
        return {}, "UNREGISTERED_CARD"
    end
    if opcg.contract_ops and opcg.contract_ops.timing_negated
        and opcg.contract_ops.timing_negated(card, timing, context) then
        return {}, "TIMING_NEGATED"
    end
    local results = {}
    for _, effect in ipairs(definition.effects) do
        local dispatch_effect = effect_for_timing(effect, timing)
        if dispatch_effect then
            local ok, value = runtime.can_resolve(card, effect.effect_id, context)
            if ok then
                local previous_effect = context.effect
                context.effect = dispatch_effect
                ok, value = resolve_effect(card, dispatch_effect, context)
                context.effect = previous_effect
            end
            results[#results + 1] = {effect_id = effect.effect_id, ok = ok, result = value}
        end
    end
    return results
end

function runtime.advance_boundary(boundary, context)
    local adapter = assert(runtime.adapter, "OPCG runtime adapter is not bound")
    assert(type(boundary) == "string" and boundary ~= "", "boundary is required")
    context = context or {}
    if adapter.advance_boundary then return adapter:advance_boundary(boundary, context) end
    return {executed = {}, expired = {}}
end

function runtime.audit_definition(definition, adapter)
    adapter = adapter or runtime.adapter
    assert(type(adapter) == "table", "adapter is required")
    local errors = {}
    local function audit_cost(cost)
        if adapter.supported_costs and not adapter.supported_costs[cost.op] then
            errors[#errors + 1] = "cost:" .. tostring(cost.op)
        end
        for _, option in ipairs(cost.options or {}) do
            for _, nested in ipairs(option) do audit_cost(nested) end
        end
    end
    assert_array(definition.effects, "definition.effects")
    for _, effect in ipairs(definition.effects) do
        for _, condition in ipairs(effect.conditions) do
            if adapter.supported_conditions and not adapter.supported_conditions[condition.op] then
                errors[#errors + 1] = "condition:" .. tostring(condition.op)
            end
        end
        for _, cost in ipairs(effect.costs) do
            audit_cost(cost)
        end
        local function audit_action(action)
            if adapter.supported_actions and not adapter.supported_actions[action.op] then
                errors[#errors + 1] = "action:" .. tostring(action.op)
            end
            for _, option in ipairs(action.options or {}) do
                for _, nested in ipairs(option) do audit_action(nested) end
            end
            for _, condition in ipairs(action.conditions or {}) do
                if adapter.supported_conditions and not adapter.supported_conditions[condition.op] then
                    errors[#errors + 1] = "condition:" .. tostring(condition.op)
                end
            end
            for _, cost in ipairs(action.replacement_costs or {}) do
                audit_cost(cost)
            end
            for _, nested in ipairs(action.replacement_actions or {}) do audit_action(nested) end
            for _, nested in ipairs(action.on_match or {}) do audit_action(nested) end
            for _, nested in ipairs(action.actions or {}) do audit_action(nested) end
        end
        for _, action in ipairs(effect.actions) do audit_action(action) end
    end
    return errors
end

return runtime

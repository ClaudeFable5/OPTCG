opcg = opcg or {}
opcg.edopro_adapter = opcg.edopro_adapter or {}

local module = opcg.edopro_adapter

local function require_method(bridge, name)
    assert(type(bridge[name]) == "function", "OPCGCore bridge is missing " .. name)
end

function module.new(bridge)
    assert(type(bridge) == "table", "OPCGCore bridge table is required")
    for _, name in ipairs({
        "BindCard", "QuarantineCard", "GetAttachedDon", "CheckCondition",
        "CanPayCost", "PayCost", "ExecuteAction",
    }) do require_method(bridge, name) end

    local adapter = {bridge=bridge}

    function adapter:register_card(card, definition)
        return self.bridge.BindCard(card, definition)
    end

    function adapter:register_review_card(card, definition)
        return self.bridge.QuarantineCard(card, definition)
    end

    function adapter:get_attached_don(card, context)
        return self.bridge.GetAttachedDon(card, context)
    end

    function adapter:check_condition(condition, context)
        return self.bridge.CheckCondition(condition.op, condition, context)
    end

    function adapter:can_pay_cost(cost, context)
        return self.bridge.CanPayCost(cost.op, cost, context)
    end

    function adapter:pay_cost(cost, context)
        return self.bridge.PayCost(cost.op, cost, context)
    end

    function adapter:execute_action(action, context)
        return self.bridge.ExecuteAction(action.op, action, context)
    end

    -- fail-closed shape gate for the queue/dispatch path (see runtime.can_resolve);
    -- bridges without the hook keep the old permissive behavior
    function adapter:effect_supported(effect, card)
        if self.bridge.EffectShapeSupported then
            return self.bridge.EffectShapeSupported(effect, card)
        end
        return true
    end

    function adapter:begin_transaction(context)
        if self.bridge.BeginTransaction then return self.bridge.BeginTransaction(context) end
        return nil
    end

    function adapter:commit_transaction(transaction, context)
        if self.bridge.CommitTransaction then return self.bridge.CommitTransaction(transaction, context) end
        return true
    end

    function adapter:rollback_transaction(transaction, context)
        if self.bridge.RollbackTransaction then return self.bridge.RollbackTransaction(transaction, context) end
        error("OPCGCore action failed without rollback support")
    end

    function adapter:advance_boundary(boundary, context)
        if self.bridge.AdvanceBoundary then return self.bridge.AdvanceBoundary(boundary, context) end
        return {executed={}, expired={}}
    end

    if bridge.GetSupportedOperations then
        local supported=bridge.GetSupportedOperations()
        adapter.supported_conditions=supported.conditions
        adapter.supported_costs=supported.costs
        adapter.supported_actions=supported.actions
    end
    return adapter
end

return module

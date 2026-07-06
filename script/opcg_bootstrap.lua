opcg = opcg or {}

Duel.LoadScript("opcg_contract.lua", true)
Duel.LoadScript("opcg_runtime.lua", true)
Duel.LoadScript("opcg_effect_queue.lua", true)
Duel.LoadScript("opcg_edopro_adapter.lua", true)
Duel.LoadScript("opcg_card_meta.lua", true)
Duel.LoadScript("opcg_printing_alias.lua", true)
Duel.LoadScript("opcg_util.lua", true)
Duel.LoadScript("opcg_don.lua", true)
Duel.LoadScript("opcg_life.lua", true)
Duel.LoadScript("opcg_battle.lua", true)
Duel.LoadScript("opcg_rules.lua", true)
Duel.LoadScript("opcg_contract_ops.lua", true)

function opcg.BindEngine(bridge)
    return opcg.runtime.bind(opcg.edopro_adapter.new(bridge))
end

-- Provide the Lua OPCGCore bridge (Phase 0 rules engine) if no native one exists
if not OPCGCore then Duel.LoadScript("opcg_core.lua", true) end

if OPCGCore then opcg.BindEngine(OPCGCore) end

return opcg

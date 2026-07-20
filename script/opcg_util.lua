-- OPCG semantic helpers over ocgcore primitives.
-- Card scripts use this layer so native core hooks can replace individual operations later.
opcg = opcg or {}

-- Native Effect:SetValue accepts only an integer or a Lua function. OPCG
-- operators also need to associate structured action tables and strings with
-- effects, so keep those values in a label-keyed Lua side table.
opcg._effect_payloads = opcg._effect_payloads or {}
opcg._next_effect_payload = opcg._next_effect_payload or 0
function opcg.SetEffectValue(effect, value)
    if value == nil then return end
    local kind = type(value)
    if kind == "number" or kind == "function" then
        effect:SetValue(value)
        return
    end
    if type(effect) == "table" then
        effect._opcg_payload = value
        return
    end
    opcg._next_effect_payload = opcg._next_effect_payload - 1
    local label = opcg._next_effect_payload
    opcg._effect_payloads[label] = value
    effect:SetLabel(label)
end
function opcg.GetEffectValue(effect)
    if not effect then return nil end
    if type(effect) == "table" and effect._opcg_payload ~= nil then
        return effect._opcg_payload
    end
    if effect.GetLabel then
        local payload = opcg._effect_payloads[effect:GetLabel()]
        if payload ~= nil then return payload end
    end
    return effect:GetValue()
end

opcg.KIND  = { LEADER = 1, CHARACTER = 2, EVENT = 3, STAGE = 4, DON = 5, HOST = 6 }

-- OPCG encodes the card KIND in cdb race, but stock card::get_race() returns 0
-- for non-MONSTER frames -- events (SPELL) and stages (FIELD SPELL) read as
-- kind 0 through GetRace(), which silently killed every IsEvent/IsStage gate.
-- GetOriginalRace() returns the raw cdb race for every frame.
-- NOTE: this core overrides type(): cards report "Card", not "userdata".
opcg.UTIL_REV = 20260705
local function kind_of(c)
	local t = type(c)
	if t ~= "Card" and t ~= "userdata" then return 0 end
	if c.GetOriginalRace then
		local r = c:GetOriginalRace()
		if r and r ~= 0 then return r end
	end
	return c.GetRace and c:GetRace() or 0
end
opcg.COLOR = { RED = 0x01, GREEN = 0x02, BLUE = 0x04, PURPLE = 0x08, BLACK = 0x10, YELLOW = 0x20 }
opcg.ATTRIBUTE = {
	SLASH = "SLASH", STRIKE = "STRIKE", RANGED = "RANGED",
	SPECIAL = "SPECIAL", WISDOM = "WISDOM",
}

opcg.KEYWORD_EFFECT = opcg.KEYWORD_EFFECT or {
	BLOCKER = 0x7f4f1101,
	RUSH = 0x7f4f1102,
	DOUBLE_ATTACK = 0x7f4f1103,
	BANISH = 0x7f4f1104,
	UNBLOCKABLE = 0x7f4f1105,
}
opcg.EFFECT_ALLOW_ATTACK_ACTIVE_CHARACTER = opcg.EFFECT_ALLOW_ATTACK_ACTIVE_CHARACTER or 0x7f4f1201
opcg.EFFECT_ALLOW_ATTACK_CHARACTER = opcg.EFFECT_ALLOW_ATTACK_CHARACTER or 0x7f4f1202
opcg.EFFECT_CANNOT_ATTACK_LEADER = opcg.EFFECT_CANNOT_ATTACK_LEADER or 0x7f4f1203
opcg.EFFECT_CANNOT_SET_ACTIVE = opcg.EFFECT_CANNOT_SET_ACTIVE or 0x7f4f1204
opcg.EFFECT_CANNOT_BE_RESTED = opcg.EFFECT_CANNOT_BE_RESTED or 0x7f4f1205
opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION = opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION or 0x7f4f1206
opcg.zone = {
	CHARACTER = { loc = LOCATION_MZONE, seqs = { 0, 1, 2, 3, 4 } },
	LEADER    = { loc = LOCATION_MZONE, seq = 5 },
	STAGE     = { loc = LOCATION_FZONE },
	LIFE      = { loc = LOCATION_EXTRA },
	DECK      = { loc = LOCATION_DECK },
	HAND      = { loc = LOCATION_HAND },
	TRASH     = { loc = LOCATION_GRAVE },
	LIMBO     = { loc = LOCATION_REMOVED },
	DON_DECK  = { loc = LOCATION_SZONE, seq = 0 },
	DON_COST  = { loc = LOCATION_SZONE, seq = 1 },
}

local function other(p) return 1 - p end
local function in_mzone_seq(c, lo, hi)
	if not c:IsLocation(LOCATION_MZONE) then return false end
	local s = c:GetSequence()
	return s >= lo and s <= hi
end
local function original_code(c)
	if c.GetOriginalCode then return c:GetOriginalCode() end
	return c:GetCode()
end
local function meta(c)
	if not c then return nil end
	return opcg.card_meta and opcg.card_meta[original_code(c)] or nil
end
local function definition(c)
	if not opcg.runtime or not opcg.runtime.get_definition then return nil end
	return opcg.runtime.get_definition(c)
end
local function has_value(set, value)
	return set ~= nil and set[value] == true
end
local function text_contains(text, needle)
	return type(text) == "string" and type(needle) == "string"
		and string.find(text, needle, 1, true) ~= nil
end

function opcg.OtherPlayer(p) return other(p) end
function opcg.GetMeta(c) return meta(c) end
function opcg.GetName(c)
	local m = meta(c)
	if m then return m.name end
	return tostring(original_code(c))
end
function opcg.HasName(c, name)
	if opcg.GetName(c) == name then return true end
	if not c or not opcg.EFFECT_NAME_ALIAS or not c.GetCardEffect then return false end
	for _, effect in ipairs({c:GetCardEffect(opcg.EFFECT_NAME_ALIAS)}) do
		local value = opcg.GetEffectValue(effect)
		if type(value) == "function" then
			if value(effect, name) then return true end
		elseif value == name then
			return true
		end
	end
	return false
end
function opcg.GetCardType(c)
	local m = meta(c)
	if m then return m.card_type end
	for name, value in pairs(opcg.KIND) do if kind_of(c) == value then return name end end
	return nil
end
function opcg.HasTrait(c, name)
	local m = meta(c)
	return m ~= nil and has_value(m.traits, name)
end
function opcg.TraitContains(c, text)
	local m = meta(c)
	if not m then return false end
	for trait in pairs(m.traits or {}) do
		if text_contains(trait, text) then return true end
	end
	return false
end
function opcg.HasAttribute(c, name)
	local m = meta(c)
	return m ~= nil and has_value(m.attributes, name)
end
function opcg.HasLifeTrigger(c)
	local d = definition(c)
	if not d then return false end
	for _, effect in ipairs(d.effects or {}) do
		for _, timing in ipairs(effect.timings or {}) do
			if timing == "LIFE_TRIGGER" then return true end
		end
	end
	return false
end
function opcg.HasAttackEffect(c)
	local d = definition(c)
	if not d then return false end
	for _, effect in ipairs(d.effects or {}) do
		for _, timing in ipairs(effect.timings or {}) do
			if timing == "WHEN_ATTACKING" or timing == "WHEN_ATTACKING_OPPONENT_LEADER"
				or timing == "WHEN_ATTACKING_OR_ATTACKED" then return true end
		end
	end
	return false
end
function opcg.HasKeyword(c, keyword)
	local effect_code = opcg.KEYWORD_EFFECT[keyword]
	if effect_code and c.IsHasEffect and c:IsHasEffect(effect_code) then return true end
	local d = definition(c)
	if not d then return false end
	for _, value in ipairs(d.keywords or {}) do
		if value == keyword then return true end
	end
	return false
end
function opcg.GrantKeyword(c, keyword, reset, reset_count)
	local code = opcg.KEYWORD_EFFECT[keyword]
	if not c or not code then return false end
	local effect = Effect.CreateEffect(c)
	effect:SetType(EFFECT_TYPE_SINGLE)
	effect:SetCode(code)
	if reset then effect:SetReset(reset, reset_count or 1) end
	c:RegisterEffect(effect)
	return true
end
function opcg.HasMatchingEffect(c, code, target, context)
	if not c or not code or not c.GetCardEffect then return false end
	for _, effect in ipairs({ c:GetCardEffect(code) }) do
		local value = opcg.GetEffectValue(effect)
		if type(value) == "function" then
			if value(effect, target, context) then return true end
		elseif value == nil or value ~= 0 then return true end
	end
	return false
end
function opcg.IsVanilla(c)
	local d = definition(c)
	return d ~= nil and #(d.effects or {}) == 0 and #(d.keywords or {}) == 0
end

function opcg.IsLeader(c)    return kind_of(c) == opcg.KIND.LEADER end
function opcg.IsCharacter(c) return kind_of(c) == opcg.KIND.CHARACTER end
function opcg.IsStage(c)     return kind_of(c) == opcg.KIND.STAGE end
function opcg.IsEvent(c)     return kind_of(c) == opcg.KIND.EVENT end
function opcg.IsDon(c)       return kind_of(c) == opcg.KIND.DON end
function opcg.IsHost(c)      return kind_of(c) == opcg.KIND.HOST end

function opcg.IsOnCharacterArea(c) return in_mzone_seq(c, 0, 4) end
function opcg.IsOnLeaderSlot(c) return in_mzone_seq(c, 5, 5) end
function opcg.IsOnField(c)
	return c:IsLocation(LOCATION_MZONE) or c:IsLocation(LOCATION_FZONE)
end
function opcg.IsInLife(c)  return c:IsLocation(LOCATION_EXTRA) end
function opcg.IsInTrash(c) return c:IsLocation(LOCATION_GRAVE) end
function opcg.IsInHand(c)  return c:IsLocation(LOCATION_HAND) end

function opcg.IsActive(c) return c:IsPosition(POS_FACEUP_ATTACK) end
function opcg.IsRested(c) return c:IsPosition(POS_FACEUP_DEFENSE) end
function opcg.SetActive(c) if opcg.HasMatchingEffect(c, opcg.EFFECT_CANNOT_SET_ACTIVE) then return false end return Duel.ChangePosition(c, POS_FACEUP_ATTACK) end
function opcg.SetRested(c, context)
	if opcg.HasMatchingEffect(c, opcg.EFFECT_CANNOT_BE_RESTED) then return false end
	local event = context or (opcg.contract_ops and opcg.contract_ops.current_context)
	if opcg.contract_ops and opcg.contract_ops.before_rest
		and not opcg.contract_ops.before_rest(c, event) then return false end
	local moved = Duel.ChangePosition(c, POS_FACEUP_DEFENSE)
	if moved and moved ~= 0 and event and event.effect and opcg.contract_ops then
		local owner = c:GetControler()
		local emitted = {}
		for key, value in pairs(event) do emitted[key] = value end
		emitted.event_target = c
		emitted.event_targets = {c}
		emitted.event_cards = {c}
		emitted.event_count = 1
		emitted.reason_player = event.effect_player or event.player
		opcg.contract_ops.emit("ON_OWN_CHARACTER_RESTED_BY_EFFECT", emitted, owner)
		if emitted.reason_player ~= nil and emitted.reason_player ~= owner then
			opcg.contract_ops.emit("ON_SELF_RESTED_BY_OPPONENT_EFFECT", emitted, owner, {c})
		end
	end
	return moved
end

function opcg.GetPower(c) return c:GetAttack() end
function opcg.GetBasePower(c)
	if c.GetBaseAttack then return c:GetBaseAttack() end
	return c:GetAttack()
end
-- Cost lives in cdb level; get_level() also zeroes non-MONSTER frames, so
-- events/stages fall back to the original printed cost (their cost modifiers
-- flow through the play-discount channel, not EFFECT_UPDATE_LEVEL).
function opcg.GetCost(c)
	local t = type(c)
	if t ~= "Card" and t ~= "userdata" then return 0 end
	local cost = c:GetLevel()
	-- 이벤트/스테이지(비몬스터 프레임)는 코어 get_level이 구조적으로 0을
	-- 반환하므로 인쇄 코스트를 원레벨에서 읽는다. 몬스터 프레임(캐릭터/리더)
	-- 은 ALLOW_NEGATIVE 전역 개방(opcg_rules) 후 0이 실값이므로 폴백 금지 —
	-- 폴백하면 "코스트를 0으로" 감소가 원가로 되살아난다.
	if cost == 0 and c.IsType and not c:IsType(TYPE_MONSTER)
		and c.GetOriginalLevel then
		cost = c:GetOriginalLevel()
	end
	if cost < 0 then cost = 0 end
	return cost
end
function opcg.GetBaseCost(c)
	if c.GetOriginalLevel then return c:GetOriginalLevel() end
	return c:GetLevel()
end

-- "the NEXT card you play costs N less" modifiers (e.g. OP12-061 E2).
-- Entries expire by turn and by uses; the play proc consumes them on summon.
opcg._play_discounts = opcg._play_discounts or {}
local function discount_applies(d, c)
	return (d.uses or 0) > 0
		and d.turn == (Duel.GetTurnCount and Duel.GetTurnCount() or 0)
		and (not d.predicate or d.predicate(c))
end
function opcg.AddPlayDiscount(player, entry)
	local list = opcg._play_discounts[player] or {}
	list[#list + 1] = entry
	opcg._play_discounts[player] = list
end
function opcg.EffectivePlayCost(c, player)
	local cost = opcg.GetCost(c)
	for _, d in ipairs(opcg._play_discounts[player] or {}) do
		if discount_applies(d, c) then cost = cost + (d.amount or 0) end
	end
	if cost < 0 then cost = 0 end
	return cost
end
function opcg.ConsumePlayDiscounts(c, player)
	for _, d in ipairs(opcg._play_discounts[player] or {}) do
		if discount_applies(d, c) then d.uses = (d.uses or 0) - 1 end
	end
end
function opcg.GetCounter(c)
	if c.GetDefense then return c:GetDefense() end
	return 0
end
function opcg.GetColors(c)
	local m = meta(c)
	return m and m.colors or c:GetAttribute()
end
function opcg.HasColor(c, color)
	local bit = type(color) == "string" and opcg.COLOR[color] or color
	return bit ~= nil and (opcg.GetColors(c) & bit) ~= 0
end

function opcg.TurnPlayer() return Duel.GetTurnPlayer() end
function opcg.IsYourTurn(p) return Duel.GetTurnPlayer() == p end
function opcg.ResolvePlayer(value, context)
	context = context or {}
	local you = context.player
	if you == nil and context.card then you = context.card:GetControler() end
	if you == nil then you = Duel.GetTurnPlayer() end
	if value == "OPPONENT" then return other(you) end
	if value == "CONTEXT" and context.target_player ~= nil then return context.target_player end
	return you
end

function opcg.GetCharacters(player)
	return Duel.GetMatchingGroup(opcg.IsCharacter, player, LOCATION_MZONE, 0, nil)
end
function opcg.GetLeader(player)
	local g = Duel.GetMatchingGroup(opcg.IsLeader, player, LOCATION_MZONE, 0, nil)
	return g:GetFirst()
end
function opcg.GetStage(player)
	return Duel.GetMatchingGroup(opcg.IsStage, player, LOCATION_FZONE, 0, nil):GetFirst()
end
function opcg.LifeCount(player) return Duel.GetFieldGroupCount(player, LOCATION_EXTRA, 0) end

local function state_matches(c, state)
	if state == nil then return true end
	if state == "ACTIVE" then return opcg.IsActive(c) end
	if state == "RESTED" then return opcg.IsRested(c) end
	return false
end
local function scalar_filter(c, key, value, context)
	if key == "trait" then return opcg.HasTrait(c, value) end
	if key == "trait_any" then
		for _, trait in ipairs(value) do if opcg.HasTrait(c, trait) then return true end end
		return false
	end
	if key == "trait_contains" then return opcg.TraitContains(c, value) end
	if key == "trait_not_contains" then return not opcg.TraitContains(c, value) end
	if key == "name" then return opcg.HasName(c, value) end
	if key == "name_neq" then return not opcg.HasName(c, value) end
	if key == "card_type" then return opcg.GetCardType(c) == value end
	if key == "card_type_any" then
		for _, kind in ipairs(value) do if opcg.GetCardType(c) == kind then return true end end
		return false
	end
	if key == "color" then return opcg.HasColor(c, value) end
	if key == "attribute" then return opcg.HasAttribute(c, value) end
	if key == "attribute_neq" then return not opcg.HasAttribute(c, value) end
	if key == "state" then return state_matches(c, value) end
	if key == "faceup" then return c:IsFaceup() == value end
	if key == "cost_eq" then return opcg.GetCost(c) == value end
	if key == "cost_lte" then return opcg.GetCost(c) <= value end
	if key == "cost_gte" then return opcg.GetCost(c) >= value end
	if key == "base_cost_eq" then return opcg.GetBaseCost(c) == value end
	if key == "base_cost_lte" then return opcg.GetBaseCost(c) <= value end
	if key == "base_cost_gte" then return opcg.GetBaseCost(c) >= value end
	if key == "power_eq" then return opcg.GetPower(c) == value end
	if key == "power_lte" then return opcg.GetPower(c) <= value end
	if key == "power_gte" then return opcg.GetPower(c) >= value end
	if key == "base_power_eq" then return opcg.GetBasePower(c) == value end
	if key == "base_power_lte" then return opcg.GetBasePower(c) <= value end
	if key == "base_power_gte" then return opcg.GetBasePower(c) >= value end
	if key == "counter_eq" then return opcg.GetCounter(c) == value end
	if key == "keyword" then return opcg.HasKeyword(c, value) end
	if key == "character_cost_lte" then
		return opcg.IsLeader(c) or (opcg.IsCharacter(c) and opcg.GetCost(c) <= value)
	end
	if key == "power_sum_lte" then return true end
	if key == "vanilla" then return opcg.IsVanilla(c) == value end
	if key == "has_trigger" then return opcg.HasLifeTrigger(c) == value end
	if key == "no_attack_effect" then return (not opcg.HasAttackEffect(c)) == value end
	if key == "exclude_self" then return not value or c ~= context.card end
	if key == "cost_lte_life_total" then
		return opcg.GetCost(c) <= opcg.LifeCount(0) + opcg.LifeCount(1)
	end
	if key == "cost_lte_life_of" then
		return opcg.GetCost(c) <= opcg.LifeCount(opcg.ResolvePlayer(value, context))
	end
	if key == "cost_lte_field_don_of" then
		-- "field DON" = cost area + attached; TotalDon also counts the DON deck (always 10)
		return opcg.GetCost(c) <= (opcg.FieldDon and opcg.FieldDon(opcg.ResolvePlayer(value, context)) or 0)
	end
	if key == "name_eq_last_target" then
		local last = context.last_target
		return not value or (last ~= nil and opcg.GetName(c) == opcg.GetName(last))
	end
	if key == "color_neq_last_target" then
		local last = context.last_target
		return not value or (last ~= nil and (opcg.GetColors(c) & opcg.GetColors(last)) == 0)
	end
	return nil
end

-- Returns predicate, or nil when the filter cannot be represented exactly.
function opcg.CompileFilter(filter, context)
	filter = filter or {}
	context = context or {}
	local supported = true
	local function check(c, current)
		for key, value in pairs(current or {}) do
			if key == "any" then
				local matched = false
				for _, branch in ipairs(value) do if check(c, branch) then matched = true break end end
				if not matched then return false end
			else
				local result = scalar_filter(c, key, value, context)
				if result == nil then supported = false return false end
				if not result then return false end
			end
		end
		return true
	end
	-- Probe keys without needing a live Card object.
	local known = {
		trait=true, trait_any=true, trait_contains=true, trait_not_contains=true,
		name=true, name_neq=true, card_type=true, card_type_any=true, color=true,
		attribute=true, attribute_neq=true, state=true, faceup=true,
		cost_eq=true, cost_lte=true, cost_gte=true,
		base_cost_eq=true, base_cost_lte=true, base_cost_gte=true, power_eq=true,
		power_lte=true, power_gte=true, base_power_eq=true, base_power_lte=true,
		base_power_gte=true, counter_eq=true, vanilla=true, has_trigger=true,
		keyword=true, character_cost_lte=true, power_sum_lte=true,
		exclude_self=true, cost_lte_life_total=true, cost_lte_life_of=true,
		cost_lte_field_don_of=true, name_eq_last_target=true,
		color_neq_last_target=true, any=true,
	}
	local function keys_ok(value)
		for key, nested in pairs(value or {}) do
			if not known[key] then return false end
			if key == "any" then
				for _, branch in ipairs(nested) do if not keys_ok(branch) then return false end end
			end
		end
		return true
	end
	if not keys_ok(filter) then return nil end
	return function(c)
		supported = true
		local result = check(c, filter)
		return supported and result
	end
end

function opcg.KindPredicate(kind)
	if kind == "LEADER" then return opcg.IsLeader end
	if kind == "CHARACTER" then return opcg.IsCharacter end
	if kind == "STAGE" then return opcg.IsStage end
	if kind == "LEADER_OR_CHARACTER" then
		return function(c) return opcg.IsLeader(c) or opcg.IsCharacter(c) end
	end
	return nil
end

function opcg.GetCandidateGroup(selector, context)
	selector = selector or {}
	context = context or {}
	local source = context.card
	local kind_filter = opcg.KindPredicate(selector.kind)
	local card_filter = opcg.CompileFilter(selector.filter, context)
	if not kind_filter or not card_filter then return nil, "UNSUPPORTED_SELECTOR" end
	local chooser = context.player
	if chooser == nil and source then chooser = source:GetControler() end
	if chooser == nil then chooser = Duel.GetTurnPlayer() end
	if selector.chooser == "OPPONENT" then chooser = 1 - chooser end
	local owner = selector.owner or "YOU"
	local target_player = opcg.ResolvePlayer(owner, context)
	local loc = selector.kind == "STAGE" and LOCATION_FZONE or LOCATION_MZONE
	local loc_self, loc_opp = loc, 0
	if owner == "ANY" then target_player, loc_self, loc_opp = chooser, loc, loc end
	return Duel.GetMatchingGroup(function(c) return kind_filter(c) and card_filter(c) end,
		target_player, loc_self, loc_opp, nil)
end

function opcg.SelectCards(selector, context)
	selector = selector or {}
	context = context or {}
	local source = context.card
	if selector.kind == "SELF" then return source and { source } or {} end
	if selector.kind == "BATTLE_ATTACKER" then
		return context.battle_attacker and { context.battle_attacker } or {}
	end
	if selector.kind == "EVENT_TARGET" then return context.event_targets or {} end
	if selector.kind == "LAST_TARGET" then return context.last_targets or {} end

	local candidates, reason = opcg.GetCandidateGroup(selector, context)
	if not candidates then return nil, reason end
	local chooser = context.player
	if chooser == nil and source then chooser = source:GetControler() end
	if chooser == nil then chooser = Duel.GetTurnPlayer() end
	if selector.chooser == "OPPONENT" then chooser = 1 - chooser end
	local available = candidates:GetCount()
	local wanted = selector.count or 1
	if selector.mode == "ALL" or wanted == 0 then wanted = available end
	local minimum = selector.mode == "EXACT" and wanted or 0
	local maximum = math.min(wanted, available)
	if available < minimum then return nil, "NOT_ENOUGH_TARGETS" end
	if maximum == 0 then return {} end
	local power_limit = selector.filter and selector.filter.power_sum_lte
	if power_limit then
		local selected, remaining = {}, power_limit
		for _ = 1, maximum do
			local affordable = candidates:Filter(function(card)
				return opcg.GetPower(card) <= remaining
			end, nil)
			if affordable:GetCount() == 0 then break end
			local card = affordable:Select(chooser, 0, 1, nil):GetFirst()
			if not card then break end
			selected[#selected + 1] = card
			remaining = remaining - opcg.GetPower(card)
			candidates:RemoveCard(card)
		end
		if #selected < minimum then return nil, "NOT_ENOUGH_TARGETS" end
		return selected
	end
	local selected = candidates:Select(chooser, minimum, maximum, nil)
	local out = {}
	for card in aux.Next(selected) do out[#out + 1] = card end
	return out
end

return opcg

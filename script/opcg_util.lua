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
-- 부여 속성(OP15-093 "속성(참)을 얻는다"): 카드에 상주 효과로 비트를 실어 두고
-- HasAttribute가 meta 속성과 함께 읽는다.
opcg.EFFECT_GRANT_ATTRIBUTE = opcg.EFFECT_GRANT_ATTRIBUTE or 0x7f4f121f
opcg.ATTRIBUTE_BITS = opcg.ATTRIBUTE_BITS or {
	STRIKE = 1, SLASH = 2, RANGED = 4, SPECIAL = 8, WISDOM = 16,
}
-- NATIVE_EFFECT(예비 함수)용 코드 해석: 숫자 그대로, "EFFECT_*"는 전역
-- 네이티브 상수, "opcg.EFFECT_*"는 커스텀 상수를 찾는다.
function opcg.ResolveNativeEffectCode(code)
	if type(code) == "number" then return code end
	if type(code) ~= "string" then return nil end
	local custom = code:match("^opcg%.(.+)$")
	if custom then return opcg[custom] end
	local value = _G[code]
	if type(value) == "number" then return value end
	return nil
end
function opcg.GrantAttribute(c, attribute, reset, reset_count)
	local bit = opcg.ATTRIBUTE_BITS[attribute]
	if not c or not bit then return false end
	local effect = Effect.CreateEffect(c)
	effect:SetType(EFFECT_TYPE_SINGLE)
	effect:SetCode(opcg.EFFECT_GRANT_ATTRIBUTE)
	effect:SetValue(bit)
	if reset then effect:SetReset(reset, reset_count or 1) end
	c:RegisterEffect(effect)
	return true
end
opcg.EFFECT_ALLOW_ATTACK_ACTIVE_CHARACTER = opcg.EFFECT_ALLOW_ATTACK_ACTIVE_CHARACTER or 0x7f4f1201
opcg.EFFECT_ALLOW_ATTACK_CHARACTER = opcg.EFFECT_ALLOW_ATTACK_CHARACTER or 0x7f4f1202
opcg.EFFECT_CANNOT_ATTACK_LEADER = opcg.EFFECT_CANNOT_ATTACK_LEADER or 0x7f4f1203
opcg.EFFECT_CANNOT_SET_ACTIVE = opcg.EFFECT_CANNOT_SET_ACTIVE or 0x7f4f1204
opcg.EFFECT_CANNOT_BE_RESTED = opcg.EFFECT_CANNOT_BE_RESTED or 0x7f4f1205
opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION = opcg.EFFECT_PREVENT_BLOCKER_ACTIVATION or 0x7f4f1206
opcg.EFFECT_DON_DECK_SIZE = opcg.EFFECT_DON_DECK_SIZE or 0x7f4f1207
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
	local m = opcg.card_meta
	if not m then return nil end
	local code = original_code(c)
	local found = m[code]
	if found then return found end
	-- 별쇄(얼트 아트) 인쇄 id: cdb alias가 정본 룰 id를 가리킨다. 별칭 표
	-- (printing_alias)가 새 세트에서 구멍 나도 여기서 정본 메타로 정규화 —
	-- EB03 별쇄 28장 누락으로 별쇄 비비 리더의 특징 조회가 전멸했던 사건
	-- (2026-07-27 유저 리플레이: 나미 EB03-006 기동이 대상도 없이 불발).
	local alias = c.GetAlias and c:GetAlias() or 0
	if alias ~= 0 and m[alias] then return m[alias] end
	local mapped = opcg.printing_alias and opcg.printing_alias[code]
	if mapped then return m[mapped] end
	return nil
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
	-- 「룰상 ~로도 취급한다」는 존 불문(총합룰: 카드명 취급은 모든 영역 상시).
	-- 종전엔 필드 진입 때 붙는 상주 효과에만 의존해 패/덱/트래시에서 별명이
	-- 증발했다(EB04-038 유저 제보). 무조건 상주 별명은 등록부(definition)에서
	-- 직접 판독한다 - 조건부 별명은 아래 기존 효과 경로가 그대로 담당.
	local d = definition(c)
	if d then
		for _, effect in ipairs(d.effects or {}) do
			local resident = false
			for _, t in ipairs(effect.timings or {}) do
				if t == "RULE" or t == "CONTINUOUS" then resident = true break end
			end
			if resident and #(effect.conditions or {}) == 0 then
				for _, action in ipairs(effect.actions or {}) do
					if action.op == "ADD_NAME_ALIAS" and action.name == name
						and #(action.conditions or {}) == 0
						and (not action.selector or action.selector.kind == "SELF") then
						return true
					end
				end
			end
		end
	end
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
	if m ~= nil and has_value(m.attributes, name) then return true end
	-- 효과로 부여된 속성(OP15-093): GRANT_ATTRIBUTE 상주 비트 검사
	local bit = opcg.ATTRIBUTE_BITS and opcg.ATTRIBUTE_BITS[name]
	if bit and c and c.GetCardEffect then
		for _, effect in ipairs({ c:GetCardEffect(opcg.EFFECT_GRANT_ATTRIBUTE) }) do
			local value = effect:GetValue()
			if type(value) == "number" and (value & bit) ~= 0 then return true end
		end
	end
	return false
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
-- 「【등장 시】 효과를 가지지 않은」(PRB01-001류) 판독기: OP09-081 티치의
-- 등장 시 무효화가 쓰는 것과 같은 등록부(definition)를 읽어 라벨 보유만
-- 본다. 기준 = ON_PLAY 타이밍(다른 *_PLAYED 계열은 남의 등장을 듣는
-- 청취 타이밍이지 그 카드의 【등장 시】 라벨이 아니다).
function opcg.HasOnPlayEffect(c)
	local d = definition(c)
	if not d then return false end
	for _, effect in ipairs(d.effects or {}) do
		for _, timing in ipairs(effect.timings or {}) do
			if timing == "ON_PLAY" then return true end
		end
	end
	return false
end
function opcg.HasKeyword(c, keyword)
	local effect_code = opcg.KEYWORD_EFFECT[keyword]
	if effect_code and c.IsHasEffect and c:IsHasEffect(effect_code) then return true end
	-- 인쇄 키워드(【블로커】【속공】 등)는 그 카드 자신의 효과 - 효과 무효
	-- (EFFECT_DISABLE, 런타임 EFFECT_NEGATED와 같은 신호) 상태면 꺼져야 한다.
	-- 종전엔 정의 목록을 무검사로 읽어 무효된 캐릭터가 블록을 선언했다
	-- (2026-07-23 유저 제보). 타 효과로 부여된 키워드는 위 네이티브 검사 몫.
	if c.IsDisabled and c:IsDisabled() then return false end
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
-- CANNOT_SET_ACTIVE(리프레시 동결)는 리프레시 자동 액티브만 막는다. 카드
-- 효과의 "액티브로 한다"는 by_effect=true로 통과한다(2026-08-12 유저 재정:
-- "리프레시에 액티브 되지 않는" 상태여도 카드 효과로는 액티브 가능).
function opcg.SetActive(c, by_effect)
	if not by_effect and opcg.HasMatchingEffect(c, opcg.EFFECT_CANNOT_SET_ACTIVE) then return false end
	return Duel.ChangePosition(c, POS_FACEUP_ATTACK)
end
-- cause: "ATTACK"(공격 선언) / "BLOCK"(블로커 발동) / "COST"(비용 지불) /
-- "EFFECT"(효과, 기본값). "레스트로 할 수 없다"(전면형)는 원인 불문 전부 막고,
-- reason=OPPONENT_EFFECT("상대의 효과로 레스트 되지 않는다")는 상대 효과만 막는다
-- - 판별은 효과에 심긴 값 함수(rest_block_value)가 이 cause/source_player로 한다.
function opcg.CanBeRested(c, cause, source_player)
	return not opcg.HasMatchingEffect(c, opcg.EFFECT_CANNOT_BE_RESTED, nil,
		{ cause = cause or "EFFECT", source_player = source_player })
end
function opcg.SetRested(c, context, cause)
	local event = context or (opcg.contract_ops and opcg.contract_ops.current_context)
	local source = event and (event.player or event.effect_player
		or (event.card and event.card.GetControler and event.card:GetControler()))
	if not opcg.CanBeRested(c, cause, source) then return false end
	if opcg.contract_ops and opcg.contract_ops.before_rest
		and not opcg.contract_ops.before_rest(c, event) then return false end
	local moved = Duel.ChangePosition(c, POS_FACEUP_DEFENSE)
	if moved and moved ~= 0 and opcg.contract_ops then
		local owner = c:GetControler()
		-- ON_SELF_RESTED: fires whenever this card actually becomes rested, by
		-- ANY cause - attack declaration (opcg_battle calls SetRested with no
		-- context), a rest-cost, or an effect. The listener card gates on its
		-- own 【자신의 턴 중】 (YOUR_TURN condition); scope is the card itself so
		-- only its own trigger evaluates.
		local base = {}
		if event then for key, value in pairs(event) do base[key] = value end end
		base.event_target = c
		base.event_targets = {c}
		base.event_cards = {c}
		base.event_count = 1
		opcg.contract_ops.emit("ON_SELF_RESTED", base, owner, {c})
		-- effect-caused rest also feeds the narrower "by effect" timings
		if event and event.effect then
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
-- [2026-08-07 안전핀] 채널 판독 재진입 잠금. IsHasEffect는 그 효과의 조건·
-- 대상 함수를 실행한다 — 그 평가 사슬이 어디서든 GetCost에 되돌아오면
-- (코스트 참조 조건/필터, 미로드 카드 지연 등록 연쇄 등) C 스택이 무한히
-- 자란다(08-07 지인 실크래시: 08-01판 데이터 C stack overflow, GetCost↔
-- continuous_condition 왕복 실측). 잠금 중 재진입은 채널 몫 없이 인쇄
-- 코스트로 즉답 — 순간의 과소가 무한 재귀보다 낫고, 바깥 판독이 끝나면
-- 정상값으로 돌아온다. 판독 자체도 pcall 격리(평가 중 오류가 코스트
-- 조회를 죽이지 않게).
local reading_hand_cost = false
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
		-- [OPCG] 비몬스터 프레임은 UPDATE_LEVEL이 코어에서 무효(card.cpp:997
		-- 이 효과 조회 전에 0 반환)라 "패의 이 카드 코스트 -N"(OP15-021 등)이
		-- 증발한다 — 상주 등록부(contract_ops MODIFY_HAND_COST)가 쌍둥이로
		-- 발신하는 전용 채널을 여기서 합산한다. 조건(트래시 매수 등)·범위
		-- (패 한정) 판정은 IsHasEffect가 효과 시스템 규칙대로 수행. 카드당
		-- 1건 판독(현 코퍼스에 중첩 사례 없음).
		if opcg.EFFECT_MODIFY_HAND_COST and c.IsHasEffect and not reading_hand_cost then
			reading_hand_cost = true
			local ok, delta = pcall(function()
				local e = c:IsHasEffect(opcg.EFFECT_MODIFY_HAND_COST)
				if not e then return 0 end
				local v = e.GetValue and e:GetValue()
				return type(v) == "number" and v or 0
			end)
			reading_hand_cost = false
			if ok and type(delta) == "number" then cost = cost + delta end
		end
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
	-- 카운터무는 cdb def=-2 - 생값 비교(counter_eq=0)가 영원히 빗나가던
	-- 원흉이라 0으로 정규화한다(EB01-001 유저 제보 2026-08-03).
	if c.GetDefense then return math.max(0, c:GetDefense()) end
	return 0
end

-- EB01-001 오뎅류 「~는 카운터 +1000을 가진다」(룰상 상주): 부여식 상주
-- 효과는 필드 밖(패)에 닿지 않아 카운터 스텝에서 증발했다. EB04-038 별명
-- 수리와 같은 교리로 등록부(definition)를 직접 판독해 카운터 스텝이
-- 가산한다. 부여자가 효과 무효(IsDisabled)면 꺼진다.
function opcg.CounterGrant(card, player)
	local total = 0
	if not (Duel and Duel.GetMatchingGroup) then return 0 end
	local group = Duel.GetMatchingGroup(function(c)
		return opcg.IsLeader(c) or opcg.IsCharacter(c) or opcg.IsStage(c)
	end, player, LOCATION_MZONE + LOCATION_FZONE, 0, nil)
	for granter in aux.Next(group) do
		if not (granter.IsDisabled and granter:IsDisabled()) then
			local d = definition(granter)
			for _, effect in ipairs((d and d.effects) or {}) do
				local resident = false
				for _, t in ipairs(effect.timings or {}) do
					if t == "RULE" or t == "CONTINUOUS" then resident = true break end
				end
				if resident and #(effect.conditions or {}) == 0 then
					for _, action in ipairs(effect.actions or {}) do
						if action.op == "MODIFY_COUNTER" and (action.amount or 0) > 0 then
							local sel = action.selector or {}
							local owner_ok = sel.owner == nil or sel.owner == "ANY"
								or (sel.owner == "YOU" and granter:GetControler() == player)
								or (sel.owner == "OPPONENT" and granter:GetControler() ~= player)
							-- [OP16-118] zone=HAND 부여("자신의 패의 ~ 카드는
							-- 카운터+2000이 된다"): 명시 존이 있으면 존중.
							local zone_ok = sel.zone == nil
								or (sel.zone == "HAND" and card:IsLocation(LOCATION_HAND))
								or (sel.zone == "FIELD" and card:IsLocation(LOCATION_MZONE))
							local kind = opcg.KindPredicate(sel.kind or "CHARACTER")
							local filt = opcg.CompileFilter(sel.filter, { card = granter, player = player })
							if owner_ok and zone_ok and kind and kind(card) and filt and filt(card) then
								total = total + (action.amount or 0)
							end
						end
					end
				end
			end
		end
	end
	return total
end

-- 카운터 스텝 전용 실효 카운터: 카드 자체 수치 + 상주 취급 가산.
function opcg.EffectiveCounter(card, player)
	return (opcg.GetCounter(card) or 0) + opcg.CounterGrant(card, player)
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
	-- "ANY": 명시적 전 상태 허용 — REST 액션이 기본으로 끼우는 state=ACTIVE를
	-- 카드 쪽에서 무효화할 때 쓴다(ST24-004 룰링: 이미 레스트인 캐릭터를 골라
	-- 바로 동결 가능, 2026-08-19 유저 하달).
	if state == "ANY" then return true end
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
	-- 둥!! 부착 참조(OP15 크리크 축): don_given=true → 1장 이상,
	-- don_gte=N → N장 이상 부착
	if key == "don_given" then return (opcg.GetAttachedDon(c) or 0) >= 1 end
	if key == "don_gte" then return (opcg.GetAttachedDon(c) or 0) >= value end
	-- 코스트 == 부착 둥!! 수(OP15-031 프린프린)
	if key == "cost_eq_attached_don" then
		return opcg.GetCost(c) == (opcg.GetAttachedDon(c) or 0)
	end
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
	if key == "no_on_play_effect" then return (not opcg.HasOnPlayEffect(c)) == value end
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
		don_given=true, don_gte=true, cost_eq_attached_don=true,
		power_lte=true, power_gte=true, base_power_eq=true, base_power_lte=true,
		base_power_gte=true, counter_eq=true, vanilla=true, has_trigger=true,
		keyword=true, character_cost_lte=true, power_sum_lte=true,
		exclude_self=true, cost_lte_life_total=true, cost_lte_life_of=true,
		cost_lte_field_don_of=true, name_eq_last_target=true,
		color_neq_last_target=true, any=true,
		-- scalar_filter가 처리하는데 이 프로브 화이트리스트에 빠져 있던 키들:
		-- 누락되면 keys_ok=false → CompileFilter가 nil → shape 미지원 판정으로
		-- 그 필터를 쓴 효과 전체가 발동 봉쇄됐다(EB03-001 비비 no_attack_effect
		-- 유저 제보). 아래는 scalar_filter 구현과 대조해 채운 잔여분.
		no_attack_effect=true, no_on_play_effect=true,
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
	if kind == "CHARACTER_OR_STAGE" then
		return function(c) return opcg.IsCharacter(c) or opcg.IsStage(c) end
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
	local loc = selector.kind == "STAGE" and LOCATION_FZONE
		or selector.kind == "CHARACTER_OR_STAGE" and (LOCATION_MZONE + LOCATION_FZONE)
		or LOCATION_MZONE
	local loc_self, loc_opp = loc, 0
	if owner == "ANY" then target_player, loc_self, loc_opp = chooser, loc, loc end
	return Duel.GetMatchingGroup(function(c) return kind_filter(c) and card_filter(c) end,
		target_player, loc_self, loc_opp, nil)
end

-- 게임 상단 선택 안내문(HINT_SELECTMSG): 문구는 저장소 루트 strings.conf의
-- !system 항목. ID는 0x100000 미만이어야 클라이언트 GetDesc가 code==0으로
-- 판정해 시스템 스트링을 찾는다(공식 ID는 ~12125, 880010대는 빈 영역).
-- [2026-08-07 병합] 레포측 OP08-118 시공분(4a36d28)을 캐논에 역이식.
opcg.HINT_SELECT_KO = 880012
opcg.SELECT_HINT_BY_AMOUNT = {
	[-3000] = 880010,
	[-2000] = 880011,
}

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
	if selector.mode == "ALL" then
		-- [2026-08-14 유저 하달, OP13-082 오로성] "모든 ~를"류 전량 지정은
		-- 선택창을 열지 않고 전원 자동 지정한다. 종전의 최소 0 선택창은
		-- 무의미한 클릭일 뿐 아니라 일부만 담는 룰 위반 여지까지 있었다.
		-- HintSelection으로 적용 대상만 양측에 공지한다.
		Duel.HintSelection(candidates, true)
		local out = {}
		for card in aux.Next(candidates) do out[#out + 1] = card end
		return out
	end
	-- [2026-08-10 유저 하달] 리더 전용 카운터(OP13-097류 "자신의 리더의 파워
	-- +N"): 후보가 자기 리더 하나뿐인 선택창은 무의미한 클릭 — 카운터
	-- 타이밍에서는 지정 없이 즉시 적용한다. HintSelection은 남겨 적용 대상
	-- 하이라이트만 양측에 공지. (리더 또는 캐릭터 선택형은 kind가 달라 종전대로,
	-- 카운터 밖 리더 지정은 무르기 여지를 보존하러 종전대로.)
	-- [2026-08-18 유저 하달] 카운터 이벤트의 자기편 파워 증가: 현재 어택 대상
	-- (블록 후엔 블로커)이 후보 안이면 지정 없이 그 카드로 즉시 확정. 룰상
	-- 다른 아군 지정도 합법이지만 '이번 배틀 동안'이라 어택 대상 외엔 무의미 -
	-- UX 단축. 필터(특징 등)로 어택 대상이 후보 밖이면 종전 선택창.
	if selector.opcg_counter_auto_target ~= nil and context.timing == "COUNTER" then
		local target = selector.opcg_counter_auto_target
		if candidates:IsContains(target) then
			Duel.HintSelection(Group.FromCards(target), true)
			return { target }
		end
	end
	if selector.kind == "LEADER" and context.timing == "COUNTER"
		and selector.chooser ~= "OPPONENT" and available == 1 then
		Duel.HintSelection(candidates, true)
		local out = {}
		for card in aux.Next(candidates) do out[#out + 1] = card end
		return out
	end
	local power_limit = selector.filter and selector.filter.power_sum_lte
	if power_limit then
		local selected, remaining = {}, power_limit
		for _ = 1, maximum do
			local affordable = candidates:Filter(function(card)
				return opcg.GetPower(card) <= remaining
			end, nil)
			if affordable:GetCount() == 0 then break end
			if selector.hint then Duel.Hint(HINT_SELECTMSG, chooser, selector.hint) end
			local picked = affordable:Select(chooser, 0, 1, nil)
			local card = picked:GetFirst()
			if not card then break end
			Duel.HintSelection(picked, true)
			selected[#selected + 1] = card
			remaining = remaining - opcg.GetPower(card)
			candidates:RemoveCard(card)
		end
		if #selected < minimum then return nil, "NOT_ENOUGH_TARGETS" end
		return selected
	end
	if selector.hint then Duel.Hint(HINT_SELECTMSG, chooser, selector.hint) end
	local selected = candidates:Select(chooser, minimum, maximum, nil)
	-- 효과 대상 가시성(2026-07-27): 고른 카드를 양측에 공지 — 현대 EDOPro
	-- 표준 관용구(트리슈라: Select 직후 Duel.HintSelection(g, true) =
	-- MSG_CARD_SELECTED 80). 이 함수의 후보는 전부 필드(MZONE/FZONE)
	-- 공개 영역이라 정보 누설 없음.
	if selected:GetCount() > 0 then Duel.HintSelection(selected, true) end
	local out = {}
	for card in aux.Next(selected) do out[#out + 1] = card end
	return out
end

-- 이번 턴 이벤트 발동 이력(플레이어별 턴 스탬프+최대 원래 코스트).
-- EVENT_ACTIVATED_THIS_TURN 조건(OP15-002 루시)이 소비한다.
opcg._event_activated_usage = opcg._event_activated_usage or {}
function opcg.RecordEventActivated(player, card)
	local turn = Duel.GetTurnCount and Duel.GetTurnCount() or 0
	local usage = opcg._event_activated_usage[player]
	if not usage or usage.turn ~= turn then
		usage = { turn = turn, max_cost = 0 }
		opcg._event_activated_usage[player] = usage
	end
	local cost = card and opcg.GetBaseCost and (opcg.GetBaseCost(card) or 0) or 0
	if cost > (usage.max_cost or 0) then usage.max_cost = cost end
end

return opcg

opcg = opcg or {}

opcg.SCHEMA_VERSION = 1
opcg._definitions = opcg._definitions or setmetatable({}, {__mode = "k"})
opcg._review_definitions = opcg._review_definitions or setmetatable({}, {__mode = "k"})

local known_timing = {
    ON_PLAY=true,
    WHEN_ATTACKING=true,
    ON_OPPONENT_ATTACK=true,
    ON_KO=true,
    ACTIVATE_MAIN=true,
    MAIN=true,
    COUNTER=true,
    ON_BLOCK=true,
    YOUR_TURN_END=true,
    CONTINUOUS_YOUR_TURN=true,
    CONTINUOUS_OPPONENT_TURN=true,
    CONTINUOUS=true,
    LIFE_TRIGGER=true,
    ON_DAMAGE_TO_OPPONENT_LIFE=true,
    ON_KO_BY_OPPONENT_EFFECT=true,
    ON_DON_RETURNED=true,
    ON_DON_ATTACHED_TO_OWN_FIELD=true,
    ON_OPPONENT_CHARACTER_RETURNED_TO_HAND_BY_OWN_EFFECT=true,
    ON_OWN_TRIGGER_CHARACTER_PLAYED=true,
    ON_OPPONENT_BLOCKER_OR_EVENT_ACTIVATED=true,
    ON_OPPONENT_EVENT_OR_TRIGGER_ACTIVATED=true,
    ON_OWN_TRAIT_CHARACTER_LEFT_BY_EFFECT=true,
    ON_OWN_TRAIT_CHARACTER_KO_OR_LEFT_BY_OPPONENT_EFFECT=true,
    ON_OPPONENT_EVENT_ACTIVATED=true,
    ON_YOUR_EVENT_ACTIVATED=true,
    ON_YOUR_LIFE_DECREASED=true,
    ON_OPPONENT_LIFE_DECREASED=true,
    ON_OWN_CHARACTER_RESTED_BY_EFFECT=true,
    ON_OWN_CHARACTER_LEFT_BY_EFFECT=true,
    ON_OPPONENT_CHARACTER_PLAYED=true,
    ON_DRAW_OUTSIDE_DRAW_PHASE=true,
    ON_LIFE_ADDED_TO_HAND=true,
    ON_BATTLE_KO=true,
    ON_ANY_CHARACTER_KO=true,
    ON_OPPONENT_CHARACTER_KO=true,
    ON_SELF_KO=true,
    ON_OPPONENT_BLOCKER_ACTIVATED=true,
    ON_LIFE_TRIGGER_ACTIVATED=true,
    YOUR_TURN_START=true,
    WHEN_BATTLING=true,
    AFTER_BATTLE_WITH_OPPONENT_CHARACTER=true,
    ON_SELF_RESTED=true,
    ON_OWN_CHARACTER_PLAYED=true,
    ON_SELF_RESTED_BY_OPPONENT_EFFECT=true,
    ON_HAND_DISCARDED_BY_TRAIT_EFFECT=true,
    WHEN_ATTACKING_OPPONENT_LEADER=true,
    WHEN_ATTACKING_OR_ATTACKED=true,
    ON_OPPONENT_HIGH_COST_OR_EFFECT_PLAY=true,
    ON_DAMAGE_OR_HIGH_POWER_CHARACTER_KO=true,
    ON_OWN_TRAIT_CHARACTER_LEFT_BY_OPPONENT_EFFECT=true,
    ON_OWN_VANILLA_CHARACTER_PLAYED_FROM_HAND=true,
    RULE=true,
}

local known_keyword = {
    BLOCKER=true,
    RUSH=true,
    DOUBLE_ATTACK=true,
    BANISH=true,
}

local known_action = {
    DRAW=true,
    TRASH_HAND=true,
    PLAY_SELF=true,
    ADD_DON=true,
    GIVE_DON=true,
    MODIFY_POWER=true,
    MODIFY_POWER_PER_COUNT=true,
    MODIFY_COST_PER_COUNT=true,
    MODIFY_HAND_COST=true,
    MODIFY_COUNTER=true,
    REST=true,
    SET_ACTIVE=true,
    KO=true,
    TRASH=true,
    MILL_DECK=true,
    ADD_LIFE_FROM_DECK_TOP=true,
    TRASH_LIFE_TOP=true,
    TAKE_LIFE_TO_HAND=true,
    GAIN_KEYWORD=true,
    ALLOW_ATTACK_ACTIVE_CHARACTER=true,
    ACTIVATE_CARD_EFFECT=true,
    SET_DON_ACTIVE=true,
    CANNOT_ATTACK=true,
    MODIFY_COST=true,
    SET_COST=true,
    SET_POWER=true,
    SET_BASE_POWER=true,
    RETURN_TO_HAND=true,
    RETURN_TO_DECK_BOTTOM=true,
    RETURN_TRASH_TO_DECK_BOTTOM=true,
    LOOK_REORDER_DECK_TOP=true,
    SEARCH_DECK_TOP=true,
    LOOK_REORDER_LIFE_TOP=true,
    CANNOT_BE_KO=true,
    CANNOT_ATTACK_LEADER=true,
    REST_DON=true,
    RETURN_DON=true,
    PLAY_FROM_HAND=true,
    ADD_TO_LIFE=true, ADD_LIFE_FROM_TRASH=true,
    ADD_LIFE_FROM_HAND=true,
    ADD_FROM_TRASH=true,
    CANNOT_LEAVE_FIELD=true,
    ALLOW_ATTACK_CHARACTER=true,
    NEGATE_EFFECTS=true,
    PREVENT_BLOCKER_ACTIVATION=true,
    ADD_SELF_TO_HAND=true,
    OPPONENT_CHOOSES=true,
    GAIN_EXTRA_TURN=true,
    ADD_NAME_ALIAS=true,
    RETURN_HAND_TO_DECK=true,
    LOOK_REORDER_ALL_LIFE=true,
    PLAY_FROM_TRASH=true,
    PLAY_FROM_DECK=true,
    SHUFFLE_DECK=true,
    REVEAL_DECK_TOP=true,
    DECLARE_COST_REVEAL=true,
    REVEAL_HAND=true,
    CANNOT_SET_ACTIVE=true,
    PLAY_FROM_HAND_OR_TRASH=true,
    PLAY_FROM_DECK_TOP=true,
    CHOOSE=true,
    IF=true,
    CANNOT_PLAY=true,
    CANNOT_TAKE_LIFE_TO_HAND=true,
    REPLACE_LIFE_TO_HAND=true,
    REPLACE_LEAVE_FIELD=true,
    REPLACE_KO=true,
    REPLACE_REST=true,
    ADD_TO_OWNER_LIFE=true,
    TRANSFER_ATTACHED_DON=true,
    CANNOT_DRAW=true,
    CANNOT_BE_RESTED=true,
    ALLOW_UNLIMITED_DECK_COPIES=true,
    DECK_BUILD_RESTRICTION=true,
    WIN_GAME=true,
    CHANGE_ATTACK_TARGET=true,
    PLAY_OWN_CHARACTERS_RESTED=true,
    NEGATE_TIMING_EFFECTS=true,
    DON_PHASE_ATTACH_TO_LEADER=true,
    DRAW_EVENT_COUNT=true,
    DISCARD_HAND_FOR_POWER=true,
    REST_CARD_OR_DON=true,
    SET_ACTIVE_CARD_OR_DON=true,
    TRASH_LIFE_UNTIL=true,
    SET_ALL_LIFE_FACE_DOWN=true,
    DRAW_TO_HAND_COUNT=true,
    TRASH_HAND_TO_COUNT=true,
    REDRAW_HAND=true,
    SET_BASE_POWER_FROM_TARGET=true,
    SWAP_BASE_POWER=true,
    MODIFY_NEXT_PLAY_COST=true,
    CANNOT_SET_DON_ACTIVE=true,
    LOOK_DECK_TOP=true,
    RETURN_DON_TO_MATCH_OPPONENT=true,
    PLAY_DISTINCT_FROM_TRASH=true,
    RETURN_LIFE_TO_DECK=true,
    CANNOT_SET_ACTIVE_CARD_OR_DON=true,
    TRASH_FACEUP_LIFE_ALL=true,
    REORDER_ALL_LIFE_RETURN_ONE_TO_DECK=true,
    PLAY_FROM_LIFE_TOP=true,
    ADD_LIFE_FROM_HAND_OR_TRASH=true,
    DEAL_DAMAGE=true,
    REQUIRE_HAND_DISCARD_TO_ATTACK=true,
    CANNOT_ATTACK_TARGETS=true,
    PLAY_TWO_FROM_TRASH_SPLIT_STATE=true,
    KO_OWN_ANY_FOR_POWER=true,
    RETURN_TRASH_ANY_FOR_POWER=true,
    RETURN_OWN_ANY_FOR_POWER=true,
    MODIFY_POWER_SPLIT=true,
    REVEAL_PLAY_SPLIT_FROM_HAND=true,
    REST_DON_FOR_POWER=true,
}

local known_condition = {
    LIFE_LTE=true,
    LIFE_GTE=true,
    HAND_LTE=true,
    LEADER_HAS_TRAIT=true,
    LEADER_NAME_IS=true,
    LEADER_IS_MULTICOLOR=true,
    FIELD_DON_GTE=true,
    CHARACTER_COUNT_GTE=true,
    LIFE_TRIGGER_ACTIVATED=true,
    FIELD_DON_LTE_OPPONENT=true,
    LIFE_TOTAL_LTE=true,
    CHARACTER_EXISTS=true,
    TRASH_GTE=true,
    LEADER_HAS_TRAIT_ANY=true,
    LEADER_TRAIT_CONTAINS=true,
    DECK_LTE=true,
    DECK_GTE=true,
    HAND_GTE=true,
    CHARACTER_NAME_ABSENT=true,
    LIFE_EQ=true,
    ONLY_CHARACTERS_MATCH=true,
    YOUR_TURN=true,
    OPPONENT_TURN=true,
    OTHER_CHARACTER_NAME_ABSENT=true,
    FIELD_DON_LT_OPPONENT=true,
    SELF_POWER_GTE=true,
    LIFE_LT_OPPONENT=true,
    LIFE_LTE_OPPONENT=true,
    ACTIVE_DON_GTE=true,
    ATTACHED_DON_GTE=true,
    FIELD_DON_EQ=true,
    ANY_FIELD_DON_EQ=true,
    FIELD_DON_LTE=true,
    FIELD_DON_EQ_OR_GTE=true,
    LEADER_STATE_IS=true,
    FACEUP_LIFE_EXISTS=true,
    LEADER_HAS_ATTRIBUTE=true,
    LEADER_HAS_COLOR=true,
    SELF_STATE_IS=true,
    SELF_PLAYED_THIS_TURN=true,
    SELF_BATTLED_OPPONENT_CHARACTER_THIS_TURN=true,
    RESTED_DON_GTE=true,
    ALL_DON_RESTED=true,
    LIFE_HAND_TOTAL_LTE=true,
    CHARACTER_COUNT_LTE=true,
    LEADER_POWER_LTE=true,
    LEADER_POWER_GTE=true,
    LEADER_NAME_IS_ANY=true,
    LEADER_OR_CHARACTER_EXISTS=true,
    FIELD_DON_BEHIND_BY_GTE=true,
    OPPONENT_RESTED_CARD_COUNT_GTE=true,
    DECK_EQ=true,
    EVENT_COUNT_GTE=true,
    EVENT_CAUSED_BY_OWN_EFFECT=true,
    EVENT_SOURCE_TRAIT_CONTAINS=true,
    EVENT_TARGET_BASE_COST_LTE=true,
    BATTLE_ATTACKER_HAS_ATTRIBUTE=true,
    EVENT_TARGET_HAS_ATTRIBUTE=true,
    EVENT_TARGET_TRAIT_CONTAINS=true,
    EVENT_TARGET_BASE_COST_GTE_OR_EFFECT_PLAY=true,
    EVENT_DAMAGE_OR_TARGET_BASE_POWER_GTE=true,
    EVENT_TARGET_BASE_POWER_GTE=true,
    RESTED_CARD_COUNT_GTE=true,
    LAST_TARGET_MATCHES=true,
    LAST_ACTION_SUCCEEDED=true,
    HAND_BEHIND_BY_GTE=true,
    LIFE_TOTAL_GTE=true,
    CHARACTER_COUNT_BEHIND_BY_GTE=true,
    TRASH_CONTAINS_NAMES=true,
    ANY_LIFE_EQ=true,
    CHARACTER_COUNT_LT=true,
    ACTIVE_DON_LTE=true,
    SOURCE_EFFECT_DRAW_UNUSED_THIS_TURN=true,
    OWN_CHARACTERS_COST_SUM_GTE=true,
}

local known_cost = {
    TRASH_HAND=true,
    REST_DON=true,
    RETURN_DON=true,
    REST_SELF=true,
    RETURN_SELF_TO_DECK_BOTTOM=true,
    TAKE_LIFE_TO_HAND=true,
    REST_OWN_CARD=true,
    MILL_DECK=true,
    TRASH_LIFE_TOP=true,
    RETURN_TRASH_TO_DECK_BOTTOM=true,
    TRASH_SELF=true,
    RETURN_SELF_TO_HAND=true,
    REVEAL_HAND=true,
    FLIP_LIFE_TOP=true,
    MODIFY_OWN_POWER=true,
    GIVE_DON=true,
    RETURN_OWN_CARD_TO_DECK_BOTTOM=true,
    RETURN_OWN_CARD_TO_HAND=true,
    TRASH_OWN_CARD=true,
    KO_OWN_CARD=true,
    RETURN_HAND_TO_DECK=true,
    ADD_OWN_CARD_TO_LIFE=true,
    RETURN_ATTACHED_DON=true,
    PLAY_FROM_HAND=true,
    ADD_OPPONENT_CARD_TO_LIFE=true,
    TRASH_CHARACTER_OR_HAND=true,
    ALTERNATIVE_COST=true,
    TRASH_FIELD_OR_HAND=true,
}

local function validate_array(value, label)
    assert(type(value) == "table", label .. " must be a table")
end

local function validate_cost(cost)
    assert(type(cost) == "table" and known_cost[cost.op], "unknown OPCG cost: " .. tostring(cost and cost.op))
    if cost.op == "ALTERNATIVE_COST" then
        validate_array(cost.options, "alternative cost options")
        for _, option in ipairs(cost.options) do
            validate_array(option, "alternative cost option")
            for _, nested_cost in ipairs(option) do validate_cost(nested_cost) end
        end
    end
end

local function validate_action(action)
    assert(type(action) == "table", "effect action must be a table")
    assert(known_action[action.op], "unknown OPCG action: " .. tostring(action.op))
    if action.op == "OPPONENT_CHOOSES" or action.op == "CHOOSE" then
        validate_array(action.options, "choice options")
        for _, option in ipairs(action.options) do
            validate_array(option, "choice option")
            for _, nested_action in ipairs(option) do validate_action(nested_action) end
        end
    end
    if action.op == "IF" then
        validate_array(action.conditions, "conditional action conditions")
        validate_array(action.actions, "conditional nested actions")
        for _, condition in ipairs(action.conditions) do
            assert(type(condition) == "table" and known_condition[condition.op], "unknown nested OPCG condition: " .. tostring(condition and condition.op))
        end
        for _, nested_action in ipairs(action.actions) do validate_action(nested_action) end
    end
    if action.replacement_costs then
        validate_array(action.replacement_costs, "replacement costs")
        for _, cost in ipairs(action.replacement_costs) do validate_cost(cost) end
    end    if action.replacement_actions then
        validate_array(action.replacement_actions, "replacement actions")
        for _, nested_action in ipairs(action.replacement_actions) do validate_action(nested_action) end
    end    if action.on_match then
        validate_array(action.on_match, "reveal match actions")
        for _, nested_action in ipairs(action.on_match) do validate_action(nested_action) end
    end
end

function opcg.ValidateDefinition(definition)
    assert(type(definition) == "table", "OPCG definition must be a table")
    assert(definition.schema_version == opcg.SCHEMA_VERSION, "unsupported OPCG schema version")
    assert(type(definition.rules_id) == "string" and definition.rules_id ~= "", "rules_id is required")
    assert(type(definition.base_card_no) == "string" and definition.base_card_no ~= "", "base_card_no is required")
    validate_array(definition.keywords, "keywords")
    validate_array(definition.effects, "effects")

    for _, keyword in ipairs(definition.keywords) do
        assert(known_keyword[keyword], "unknown OPCG keyword: " .. tostring(keyword))
    end
    for _, effect in ipairs(definition.effects) do
        assert(type(effect.effect_id) == "string", "effect_id is required")
        validate_array(effect.timings, "effect.timings")
        validate_array(effect.conditions, "effect.conditions")
        validate_array(effect.costs, "effect.costs")
        validate_array(effect.actions, "effect.actions")
        for _, timing in ipairs(effect.timings) do
            assert(known_timing[timing], "unknown OPCG timing: " .. tostring(timing))
        end
        for _, condition in ipairs(effect.conditions) do
            assert(type(condition) == "table" and known_condition[condition.op], "unknown OPCG condition: " .. tostring(condition and condition.op))
        end
        for _, cost in ipairs(effect.costs) do
            validate_cost(cost)
        end
        for _, action in ipairs(effect.actions) do
            validate_action(action)
        end
    end
    return true
end

-- 선택지 라벨은 cdb str9+에 카드당 이어붙여 저장된다(생성 도구와 동일한
-- 순회 순서) — 각 CHOOSE/OPPONENT_CHOOSES에 시작 슬롯을 배정해 둔다
local function assign_choice_string_bases(definition)
    local next_base = 8
    local function walk(actions)
        for _, action in ipairs(actions or {}) do
            if action.op == "CHOOSE" or action.op == "OPPONENT_CHOOSES" then
                action._string_base = next_base
                next_base = next_base + #(action.options or {})
                for _, option in ipairs(action.options or {}) do walk(option) end
            elseif action.op == "IF" then
                walk(action.actions)
            end
        end
    end
    for _, effect in ipairs(definition.effects or {}) do walk(effect.actions) end
end

function opcg.RegisterCard(card, definition)
    assert(card ~= nil, "card is required")
    opcg.ValidateDefinition(definition)
    assign_choice_string_bases(definition)
    opcg._definitions[card] = definition
    if opcg.runtime and opcg.runtime.register_card then
        return opcg.runtime.register_card(card, definition)
    end
    return definition
end

function opcg.ValidateReviewDefinition(definition)
    assert(type(definition) == "table", "OPCG review definition must be a table")
    assert(definition.schema_version == opcg.SCHEMA_VERSION, "unsupported OPCG schema version")
    assert(definition.compile_status == "REVIEW", "review definition must be fail-closed")
    assert(type(definition.rules_id) == "string" and definition.rules_id ~= "", "rules_id is required")
    assert(type(definition.base_card_no) == "string" and definition.base_card_no ~= "", "base_card_no is required")
    validate_array(definition.diagnostics, "diagnostics")
    validate_array(definition.effects, "effects")
    for _, effect in ipairs(definition.effects) do
        assert(type(effect.effect_id) == "string", "review effect_id is required")
        assert(type(effect.source_text) == "string" and effect.source_text ~= "", "review source_text is required")
        validate_array(effect.timings, "review effect.timings")
        validate_array(effect.conditions, "review effect.conditions")
        validate_array(effect.costs, "review effect.costs")
        validate_array(effect.actions, "review effect.actions")
        validate_array(effect.diagnostics, "review effect.diagnostics")
    end
    return true
end

function opcg.RegisterReviewCard(card, definition)
    assert(card ~= nil, "card is required")
    opcg.ValidateReviewDefinition(definition)
    opcg._review_definitions[card] = definition
    if opcg.runtime and opcg.runtime.register_review_card then
        return opcg.runtime.register_review_card(card, definition)
    end
    return definition
end

return opcg

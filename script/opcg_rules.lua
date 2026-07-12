-- OPCG rule entry points shared by Lua and the native turn/battle controller.
opcg = opcg or {}
opcg.rules = opcg.rules or {}
local R = opcg.rules
local EVENT_OPCG_POST_DRAW_SETUP = 0x1000f001
local REDRAW_PROMPT_CARD = opcg.DON_DECK_HOST_ID or 879999998
local ATTACH_DON_DESC = 1240
local ATTACH_DON_FLAG = 0x7f4f1240

local function is_attach_don_target(card, player)
	return card and card:IsLocation(LOCATION_MZONE)
		and card:GetControler() == player
		and (opcg.IsLeader(card) or opcg.IsCharacter(card))
end

-- gframe/core may call this repeatedly during Main Phase. Giving DON is not a
-- once-per-card ignition effect; any eligible cost-area DON can be given.
function R.attach_don(player, target, count, state)
	if not is_attach_don_target(target, player) then return 0 end
	return opcg.GiveDon(player, target, count or 1, state)
end

-- Manual DON!! attach is modeled as a granted summon-procedure button on each
-- legal leader/character. The procedure's operation gives DON and deliberately
-- leaves the summon group empty, so no Special Summon is actually performed.
function R.register_attach_don_grant(host)
	if not host or not host.RegisterEffect then return end
	if host.GetFlagEffect and host:GetFlagEffect(ATTACH_DON_FLAG) > 0 then return end
	if host.RegisterFlagEffect then
		host:RegisterFlagEffect(ATTACH_DON_FLAG, 0, 0, 1)
	end

	local proc = Effect.CreateEffect(host)
	proc:SetType(EFFECT_TYPE_FIELD)
	proc:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
	proc:SetCode(EFFECT_SPSUMMON_PROC_G)
	proc:SetRange(LOCATION_MZONE)
	proc:SetDescription(ATTACH_DON_DESC)
	proc:SetCondition(function(e, c)
		return opcg.ActiveDon(e:GetHandlerPlayer()) > 0
	end)
	proc:SetOperation(function(e, tp, eg, ep, ev, re, r, rp)
		local target = e:GetHandler()
		local player = tp
		if is_attach_don_target(target, player) then
			opcg.GiveDon(player, target, 1, "ACTIVE")
		end
	end)

	local grant = Effect.CreateEffect(host)
	grant:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_GRANT)
	grant:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
	grant:SetRange(LOCATION_SZONE)
	grant:SetTargetRange(LOCATION_MZONE, 0)
	grant:SetLabelObject(proc)
	Duel.RegisterEffect(grant,host:GetOwner())
end

function R.damage_leader(player, amount, context)
	return opcg.life.damage_leader(player, amount or 1, context)
end

function R.resolve_attack(attacker, target, context)
	return opcg.battle.resolve_attack(attacker, target, context)
end

-- Native OPCG turn structure calls these at non-chain rule boundaries.
function R.refresh_phase(player)
	local cards = Duel.GetMatchingGroup(function(c)
		return (opcg.IsLeader(c) or opcg.IsCharacter(c) or opcg.IsStage(c))
			and c:GetControler() == player and opcg.IsRested(c)
	end, player, LOCATION_MZONE + LOCATION_FZONE, 0, nil)
	for card in aux.Next(cards) do opcg.SetActive(card) end
	return opcg.RefreshDon(player)
end
function R.don_phase(player)
	local starting_don = opcg._turn_state and opcg._turn_state.field_don_at_start
		or opcg.FieldDon(player)
	local added = opcg.DonPhase(player)
	-- redirect effects act on DON *being placed this phase* (놓이는 둥):
	-- with the DON deck dry (added == 0) there is nothing to redirect, and
	-- redirects can never exceed what was actually placed.
	local redirectable = added
	if redirectable > 0 and Duel.IsPlayerAffectedByEffect and opcg.EFFECT_DON_PHASE_ATTACH then
		for _, effect in ipairs({Duel.IsPlayerAffectedByEffect(player, opcg.EFFECT_DON_PHASE_ATTACH)}) do
			local action = opcg.GetEffectValue(effect)
			local leader = opcg.GetLeader(player)
			if leader and type(action) == "table" and redirectable > 0 then
				local context = {
					card=effect:GetHandler(), player=player,
					field_don_snapshot=starting_don,
				}
				local allowed = true
				for _, condition in ipairs(action.conditions or {}) do
					if not OPCGCore.CheckCondition(condition.op, condition, context) then allowed = false break end
				end
				if allowed then
					local given = opcg.GiveDon(player, leader,
						math.min(action.count or 1, redirectable), "ACTIVE")
					redirectable = redirectable - given
				end
			end
		end
	end
	return added
end

-- The native leave-field redirect must call this before ordinary overlay disposal.
function R.before_battler_leaves(card)
	return opcg.ReturnAttachedDon(card)
end

-- OPCG stages are PLAYED: rest cost-N active DON, then the card goes face-up
-- onto the stage zone (an old stage is trashed by the core's replace rule).
-- EFFECT_TYPE_ACTIVATE is the only stock path that places a spell face-up from
-- hand, so it is the carrier -- there is no YGO "activation" flavor beyond it.
-- Called per stage card from C.BindCard.
function R.register_stage_play(card)
	local e = Effect.CreateEffect(card)
	e:SetType(EFFECT_TYPE_ACTIVATE)
	e:SetCode(EVENT_FREE_CHAIN)
	e:SetCost(function(ce, tp, eg, ep, ev, re, r, rp, chk)
		local cost = opcg.GetCost(ce:GetHandler())
		if chk == 0 then return opcg.CanRestDon(tp, cost) end
		opcg.RestDon(tp, cost)
	end)
	e:SetOperation(function(ce, tp)
		local card = ce:GetHandler()
		if opcg.EmitPlayed then
			opcg.EmitPlayed(card, tp, {
				played_card=card,
				played_player=tp,
				event_target=card,
				event_targets={card},
				event_cards={card},
				event_count=1,
				event_player=tp,
			})
		end
	end)
	card:RegisterEffect(e)
end

R._game_start_guard = R._game_start_guard or {}
local game_start_guard = R._game_start_guard
local function dispatch_game_start(player)
	if not (OPCGCore and OPCGCore.DispatchTiming) then return end
	local leader = opcg.GetLeader(player)
	if not leader then return end
	OPCGCore.DispatchTiming(leader, "GAME_START", {
		card=leader, player=player, event_player=player,
		event_target=leader, event_targets={leader}, event_cards={leader}, event_count=1,
	})
end
function R.register_game_start()
	if not (aux and aux.GlobalCheck and Effect and Effect.GlobalEffect) then return end
	if R._game_start_registered then return end
	R._game_start_registered = true
	aux.GlobalCheck(game_start_guard, function()
		local startup_done = {}
		local game_start_done = {}
		local startup = Effect.GlobalEffect()
		startup:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		startup:SetCode(EVENT_STARTUP)
		startup:SetOperation(function()
			-- [원설계] Under DUEL_OPCG_SCRIPTED_RPS the network SELECT_HAND/TP
			-- handshake is a fast-forwarded formality: the REAL rock-paper-
			-- scissors runs HERE, official-sequence style — leaders start
			-- REVEALED (리더 보고 시작), then the RPS winner picks first/second
			-- (Duel.SetTurnPlayer, honored by the core Startup processor).
			-- Without the flag (headless harnesses, solo) turn order stays
			-- as given.
			local scripted_rps = Duel.IsDuelType
				and Duel.IsDuelType(0x4000000000) or false
			for _, player in ipairs({ 0, 1 }) do
				if not startup_done[player] then
					startup_done[player] = true
					-- Hosts and all 10 physical DON exist before any opening setup continues.
					opcg.SetupDonHosts(player)
					-- The v1 monster-click attach (SPSUMMON_PROC_G grant) is
					-- superseded by the per-DON ignition; granting it would put
					-- a phantom summon command on every leader/character.
					if not opcg.GetLeader(player) then
						local leader = Duel.GetMatchingGroup(opcg.IsLeader, player,
							LOCATION_DECK + LOCATION_EXTRA, 0, nil):GetFirst()
						if leader then
							-- leaders are PUBLIC from the start (공식: 리더 보고
							-- 시작) — the scripted RPS only decides turn order
							Duel.MoveToField(leader, player, player, LOCATION_MZONE,
								POS_FACEUP_ATTACK,
								true, 1 << opcg.zone.LEADER.seq)
						end
					end
				end
			end
			if scripted_rps and not R._rps_done then
				R._rps_done = true
				-- the REAL simultaneous RPS (MSG_ROCK_PAPER_SCISSORS 132 +
				-- MSG_HAND_RES 133, native client hand dialog); repeats on ties
				local winner = Duel.RockPaperScissors(true)
				-- stock system strings 100/101 ("Go first"/"Go second") —
				-- built into every client's strings.conf, immune to cdb state
				local go_first = Duel.SelectOption(winner, 100, 101) == 0
				Duel.SetTurnPlayer(go_first and winner or 1 - winner)
			end
			for _, player in ipairs({ 0, 1 }) do
				if startup_done[player] and not game_start_done[player] then
					game_start_done[player] = true
					dispatch_game_start(player)
				end
			end
			-- Opening draw completes in the native Startup processor; the custom
			-- post-draw event below then handles redraw and ordered life setup.
		end)
		Duel.RegisterEffect(startup, 0)

		local setup = Effect.GlobalEffect()
		setup:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		setup:SetCode(EVENT_OPCG_POST_DRAW_SETUP)
		setup:SetOperation(function()
			for _, player in ipairs({ 0, 1 }) do
				if Duel.SelectYesNo(player, aux.Stringid(REDRAW_PROMPT_CARD, 0)) then
					local hand = Duel.GetFieldGroup(player, LOCATION_HAND, 0)
					Duel.SendtoDeck(hand, nil, SEQ_DECKSHUFFLE, REASON_RULE)
					Duel.ShuffleDeck(player)
					Duel.Draw(player, 5, REASON_RULE)
				end
			end
			for _, player in ipairs({ 0, 1 }) do
				local leader = opcg.GetLeader(player)
				local life = leader and leader:GetLevel() or 0
				for _ = 1, life do
					local top = Duel.GetDecktopGroup(player, 1)
					if top:GetCount() == 0 then break end
					-- Repeated one-card moves preserve the official order:
					-- the original deck top becomes the bottom life.
					Duel.Sendto(top, LOCATION_EXTRA, REASON_RULE,
						POS_FACEDOWN_DEFENSE, player, 0)
				end
			end
		end)
		Duel.RegisterEffect(setup, 0)

		local refresh = Effect.GlobalEffect()
		refresh:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		refresh:SetCode(EVENT_PHASE_START + PHASE_DRAW)
		refresh:SetOperation(function()
			local player = Duel.GetTurnPlayer()
			opcg._turn_state = {
				life_trigger_activated=false,
				field_don_at_start=opcg.FieldDon(player),
			}
			R.refresh_phase(player)
			if opcg.contract_ops then opcg.contract_ops.emit("YOUR_TURN_START",
				{player=player, event_player=player}, player) end
		end)
		Duel.RegisterEffect(refresh, 0)

		local don_phase = Effect.GlobalEffect()
		don_phase:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		don_phase:SetCode(EVENT_PHASE_START + PHASE_STANDBY)
		don_phase:SetOperation(function()
			R.don_phase(Duel.GetTurnPlayer())
		end)
		Duel.RegisterEffect(don_phase, 0)

		-- Playing a character IS the normal summon, but its cost is DON: a global
		-- EFFECT_LIMIT_SUMMON_PROC replaces the whole YGO summon/tribute procedure
		-- with "rest cost-N active DON, then place". card::filter_summon_procedure
		-- collects field auras too, so one effect covers every character in hand.
		local play_proc = Effect.GlobalEffect()
		play_proc:SetType(EFFECT_TYPE_FIELD)
		play_proc:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
		play_proc:SetCode(EFFECT_LIMIT_SUMMON_PROC)
		play_proc:SetTargetRange(LOCATION_HAND, LOCATION_HAND)
		-- NO SetTarget here: on summon-proc effects the target slot is the
		-- tribute-selection callback, invoked as (e,tp,eg,ep,ev,re,r,rp,c,...)
		-- (operations.cpp SummonRule case 4) -- a 2-arg aura filter there gets
		-- tp as its card and crashes. Kind filtering lives in the condition.
		local function own_field_character(fc, tp)
			return opcg.IsCharacter(fc) and fc:GetControler() == tp
		end
		play_proc:SetCondition(function(e, c)
			-- c == nil is the effect-availability probe, not a summon check.
			if c == nil then return true end
			if not opcg.IsCharacter(c) then return false end
			local tp = c:GetControler()
			if opcg.contract_ops and opcg.contract_ops.player_has
				and opcg.contract_ops.player_has(tp, opcg.EFFECT_CANNOT_PLAY, c) then return false end
			local cost = opcg.EffectivePlayCost and opcg.EffectivePlayCost(c, tp) or opcg.GetCost(c)
			if not opcg.CanRestDon(tp, cost) then return false end
			if Duel.GetLocationCount(tp, LOCATION_MZONE) > 0 then return true end
			-- full character area: the official rule still allows the play by
			-- trashing one of your characters to open the slot
			return Duel.IsExistingMatchingCard(own_field_character, tp,
				LOCATION_MZONE, 0, 1, nil, tp)
		end)
		play_proc:SetOperation(function(e, tp, eg, ep, ev, re, r, rp, c)
			local cost = opcg.EffectivePlayCost and opcg.EffectivePlayCost(c, tp) or opcg.GetCost(c)
			opcg.RestDon(tp, cost)
			if opcg.ConsumePlayDiscounts then opcg.ConsumePlayDiscounts(c, tp) end
			if Duel.GetLocationCount(tp, LOCATION_MZONE) <= 0 then
				-- 풀필드 등장: trash 1 own character to make room. This is a
				-- RULE placement, deliberately NOT a K.O. (REASON_RULE, no
				-- destroy): [KO시] must stay silent and KO replacements must
				-- not trigger on the pushed-out character.
				Duel.Hint(HINT_SELECTMSG, tp, HINTMSG_TOGRAVE)
				local victim = Duel.SelectMatchingCard(tp, own_field_character,
					tp, LOCATION_MZONE, 0, 1, 1, nil, tp)
				if victim and victim:GetCount() > 0 then
					Duel.SendtoGrave(victim, REASON_RULE)
				end
			end
		end)
		play_proc:SetValue(SUMMON_TYPE_NORMAL)
		Duel.RegisterEffect(play_proc, 0)

		-- ===== 네이티브 배틀 심판 심(임시방편, 2026-07-12) =====
		-- 어택이 네이티브 배틀 머신(idle t=9 → BattleCommand)을 타는 새 구조에서
		-- 스톡 YGO 심판을 OPCG 룰로 교정하는 효과 레이어. 판정의 코어 이관이
		-- 완성되면 이 블록은 통째로 은퇴한다.
		-- [유저 설계 3종]
		-- (a) 어택 선언 시 공격자 즉시 레스트 (공식 룰)
		local rest_on_declare = Effect.GlobalEffect()
		rest_on_declare:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		rest_on_declare:SetCode(EVENT_ATTACK_ANNOUNCE)
		rest_on_declare:SetOperation(function()
			local attacker = Duel.GetAttacker()
			if attacker and not opcg.IsRested(attacker) then opcg.SetRested(attacker) end
		end)
		Duel.RegisterEffect(rest_on_declare, 0)
		-- (b) 레스트(수비표시)여도 어택이 취소되지 않게 — processor:5104의
		-- POS_DEFENSE 취소 검사 면제. value=0(거짓) = 판정 스탯은 수비력으로
		-- 치환하지 않고 공격력 유지(3021행 게이트).
		local defense_attack = Effect.GlobalEffect()
		defense_attack:SetType(EFFECT_TYPE_FIELD)
		defense_attack:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
		defense_attack:SetCode(EFFECT_DEFENSE_ATTACK)
		defense_attack:SetTargetRange(LOCATION_MZONE, LOCATION_MZONE)
		defense_attack:SetValue(0)
		Duel.RegisterEffect(defense_attack, 0)
		-- (c) 단, 레스트 카드는 어택 선언 자체가 불가 — (b)의 전역 부여가
		-- 수비표시 선언을 허용해버리는 부작용 봉쇄.
		local rested_cannot_attack = Effect.GlobalEffect()
		rested_cannot_attack:SetType(EFFECT_TYPE_FIELD)
		rested_cannot_attack:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
		rested_cannot_attack:SetCode(EFFECT_CANNOT_ATTACK)
		rested_cannot_attack:SetTargetRange(LOCATION_MZONE, LOCATION_MZONE)
		-- 현행 공격자는 면제: 선언 시 레스트되므로(심 a) 이 오라가 자기
		-- 어택을 사살하지 않게 (5087 is_capable_attack 재검사 대응)
		rested_cannot_attack:SetTarget(function(_, c)
			return opcg.IsRested(c) and c ~= Duel.GetAttacker()
		end)
		Duel.RegisterEffect(rested_cannot_attack, 0)
		-- (d) 공격자와 리더는 전투로 파괴되지 않음 (동률 상호자폭 차단 + 리더 특례)
		local battle_immune = Effect.GlobalEffect()
		battle_immune:SetType(EFFECT_TYPE_FIELD)
		battle_immune:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
		battle_immune:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
		battle_immune:SetTargetRange(LOCATION_MZONE, LOCATION_MZONE)
		battle_immune:SetTarget(function(_, c)
			return c == Duel.GetAttacker() or opcg.IsLeader(c)
		end)
		battle_immune:SetValue(1)
		Duel.RegisterEffect(battle_immune, 0)
		-- [검산 보완 3종]
		-- (1)+(2) 판정 스탯 통일: 양측 모두 '파워(공격력)'로 비교하고, 공격자에
		-- +1을 줘서 '이상이면 KO'(동률 KO)를 스톡의 '초과 파괴' 분기로 관철.
		-- (수비표시 타겟 분기는 동률 무파괴라 +1이 유일한 무개조 우회.
		--  표시 파워에는 영향 없음 — 전투 판정 전용 스탯.)
		local battle_stat = Effect.GlobalEffect()
		battle_stat:SetType(EFFECT_TYPE_FIELD)
		battle_stat:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
		battle_stat:SetCode(EFFECT_CHANGE_BATTLE_STAT)
		battle_stat:SetTargetRange(LOCATION_MZONE, LOCATION_MZONE)
		battle_stat:SetValue(function(_, c)
			if c == Duel.GetAttacker() then return c:GetAttack() + 1 end
			return c:GetAttack()
		end)
		Duel.RegisterEffect(battle_stat, 0)
		-- (3a) 전투 데미지는 LP에 반영 금지 — 코어 LP로 승패가 나면 안 됨
		local no_lp_damage = Effect.GlobalEffect()
		no_lp_damage:SetType(EFFECT_TYPE_FIELD)
		no_lp_damage:SetProperty(EFFECT_FLAG_PLAYER_TARGET + EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
		no_lp_damage:SetCode(EFFECT_AVOID_BATTLE_DAMAGE)
		no_lp_damage:SetTargetRange(1, 1)
		no_lp_damage:SetValue(1)
		Duel.RegisterEffect(no_lp_damage, 0)
		-- (3b) 타겟 적법성: 액티브 캐릭터는 피어택 불가 (레스트 캐릭터·리더만 유효)
		local active_untargetable = Effect.GlobalEffect()
		active_untargetable:SetType(EFFECT_TYPE_FIELD)
		active_untargetable:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
		active_untargetable:SetCode(EFFECT_CANNOT_BE_BATTLE_TARGET)
		active_untargetable:SetTargetRange(0, LOCATION_MZONE)
		active_untargetable:SetTarget(function(_, c)
			return opcg.IsCharacter(c) and not opcg.IsRested(c)
		end)
		active_untargetable:SetValue(1)
		Duel.RegisterEffect(active_untargetable, 0)
		-- (3c) 리더 피격 판정: 공격자 파워 ≥ 리더 파워면 라이프 1 데미지(+트리거)
		local leader_hit = Effect.GlobalEffect()
		leader_hit:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		leader_hit:SetCode(EVENT_BATTLED)
		leader_hit:SetOperation(function()
			local attacker, target = Duel.GetAttacker(), Duel.GetAttackTarget()
			if not attacker or not target or not opcg.IsLeader(target) then return end
			if opcg.IsLeader(attacker) or opcg.IsCharacter(attacker) then
				if attacker:GetAttack() >= target:GetAttack() then
					opcg.life.damage_leader(target:GetControler(), 1,
						{source="BATTLE", attacker=attacker, target=target})
				end
			end
		end)
		Duel.RegisterEffect(leader_hit, 0)
		-- ===== 심 끝 =====

		local rested_play = Effect.GlobalEffect()
		rested_play:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		rested_play:SetCode(EVENT_SUMMON_SUCCESS)
		rested_play:SetOperation(function(_, _, group)
			if not group then return end
			for card in aux.Next(group) do
				local player = card:GetControler()
				if opcg.IsCharacter(card) and opcg.contract_ops
					and opcg.contract_ops.player_has(player, opcg.EFFECT_PLAY_RESTED, card) then
					opcg.SetRested(card)
				end
				if opcg.IsCharacter(card) and opcg.EmitPlayed then
					opcg.EmitPlayed(card, player, {
						played_card=card,
						played_player=player,
						event_target=card,
						event_targets={card},
						event_cards={card},
						event_count=1,
						event_player=player,
					})
				end
			end
		end)
		Duel.RegisterEffect(rested_play, 0)

		-- OPCG has no face-down set; close the free MSET path outright.
		local no_set = Effect.GlobalEffect()
		no_set:SetType(EFFECT_TYPE_FIELD)
		no_set:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
		no_set:SetCode(EFFECT_LIMIT_SET_PROC)
		no_set:SetTargetRange(LOCATION_HAND, LOCATION_HAND)
		-- (same target-slot caveat as play_proc; condition alone blocks the set)
		no_set:SetCondition(function(e, c) return c == nil end)
		Duel.RegisterEffect(no_set, 0)

		-- ...and no face-down spells either: stages are played via
		-- register_stage_play, events resolve from hand. (CANNOT_SSET is a plain
		-- card aura -- is_affected_by_effect -- so a 2-arg target is safe here.)
		local no_sset = Effect.GlobalEffect()
		no_sset:SetType(EFFECT_TYPE_FIELD)
		no_sset:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
		no_sset:SetCode(EFFECT_CANNOT_SSET)
		no_sset:SetTargetRange(LOCATION_HAND, LOCATION_HAND)
		no_sset:SetTarget(function(e, c) return opcg.IsStage(c) or opcg.IsEvent(c) end)
		Duel.RegisterEffect(no_sset, 0)

		-- OPCG has no hand size limit: lift the YGO end-phase discard cap
		-- (processor.cpp EP adjust reads the LAST EFFECT_HAND_LIMIT value).
		local no_hand_cap = Effect.GlobalEffect()
		no_hand_cap:SetType(EFFECT_TYPE_FIELD)
		no_hand_cap:SetProperty(EFFECT_FLAG_PLAYER_TARGET + EFFECT_FLAG_CANNOT_DISABLE)
		no_hand_cap:SetCode(EFFECT_HAND_LIMIT)
		no_hand_cap:SetTargetRange(1, 1)
		no_hand_cap:SetValue(99)
		Duel.RegisterEffect(no_hand_cap, 0)

		-- Any number of characters may be played per turn (DON permitting);
		-- lift the YGO one-normal-summon-per-turn count.
		local free_count = Effect.GlobalEffect()
		free_count:SetType(EFFECT_TYPE_FIELD)
		free_count:SetProperty(EFFECT_FLAG_PLAYER_TARGET + EFFECT_FLAG_CANNOT_DISABLE)
		free_count:SetCode(EFFECT_SET_SUMMON_COUNT_LIMIT)
		free_count:SetTargetRange(1, 1)
		free_count:SetValue(99)
		Duel.RegisterEffect(free_count, 0)
	end)
end

return opcg.rules

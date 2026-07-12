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
	if Duel.IsPlayerAffectedByEffect and opcg.EFFECT_DON_PHASE_ATTACH then
		for _, effect in ipairs({Duel.IsPlayerAffectedByEffect(player, opcg.EFFECT_DON_PHASE_ATTACH)}) do
			local action = opcg.GetEffectValue(effect)
			local leader = opcg.GetLeader(player)
			if leader and type(action) == "table" then
				local context = {
					card=effect:GetHandler(), player=player,
					field_don_snapshot=starting_don,
				}
				local allowed = true
				for _, condition in ipairs(action.conditions or {}) do
					if not OPCGCore.CheckCondition(condition.op, condition, context) then allowed = false break end
				end
				if allowed then opcg.GiveDon(player, leader, action.count or 1, "ACTIVE") end
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
		play_proc:SetCondition(function(e, c)
			-- c == nil is the effect-availability probe, not a summon check.
			if c == nil then return true end
			if not opcg.IsCharacter(c) then return false end
			local tp = c:GetControler()
			if opcg.contract_ops and opcg.contract_ops.player_has
				and opcg.contract_ops.player_has(tp, opcg.EFFECT_CANNOT_PLAY, c) then return false end
			local cost = opcg.EffectivePlayCost and opcg.EffectivePlayCost(c, tp) or opcg.GetCost(c)
			return Duel.GetLocationCount(tp, LOCATION_MZONE) > 0
				and opcg.CanRestDon(tp, cost)
		end)
		play_proc:SetOperation(function(e, tp, eg, ep, ev, re, r, rp, c)
			local cost = opcg.EffectivePlayCost and opcg.EffectivePlayCost(c, tp) or opcg.GetCost(c)
			opcg.RestDon(tp, cost)
			if opcg.ConsumePlayDiscounts then opcg.ConsumePlayDiscounts(c, tp) end
		end)
		play_proc:SetValue(SUMMON_TYPE_NORMAL)
		Duel.RegisterEffect(play_proc, 0)

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

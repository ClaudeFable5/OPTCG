-- OPCG rule entry points shared by Lua and the native turn/battle controller.
opcg = opcg or {}
opcg.rules = opcg.rules or {}
local R = opcg.rules
local EVENT_OPCG_POST_DRAW_SETUP = 0x1000f001
local REDRAW_PROMPT_CARD = opcg.DON_DECK_HOST_ID or 879999998

-- gframe/core may call this repeatedly during Main Phase. Giving DON is not a
-- once-per-card ignition effect; any eligible cost-area DON can be given.
function R.attach_don(player, target, count, state)
	if not target or target:GetControler() ~= player then return 0 end
	return opcg.GiveDon(player, target, count or 1, state)
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
function R.don_phase(player) return opcg.DonPhase(player) end

-- The native leave-field redirect must call this before ordinary overlay disposal.
function R.before_battler_leaves(card)
	return opcg.ReturnAttachedDon(card)
end

local game_start_guard = {}
function R.register_game_start()
	if not (aux and aux.GlobalCheck and Effect and Effect.GlobalEffect) then return end
	aux.GlobalCheck(game_start_guard, function()
		local startup = Effect.GlobalEffect()
		startup:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		startup:SetCode(EVENT_STARTUP)
		startup:SetOperation(function()
			-- Network/local duel setup already resolves first player before the
			-- core starts. Running another RPS here would desync both clients.
			for _, player in ipairs({ 0, 1 }) do
				-- Hosts and all 10 physical DON exist before any opening setup continues.
				opcg.SetupDonHosts(player)
				local leader = Duel.GetMatchingGroup(opcg.IsLeader, player, LOCATION_DECK, 0, nil):GetFirst()
				if leader then
					Duel.MoveToField(leader, player, player, LOCATION_MZONE,
						POS_FACEUP_ATTACK, true, 1 << opcg.zone.LEADER.seq)
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
			R.refresh_phase(Duel.GetTurnPlayer())
		end)
		Duel.RegisterEffect(refresh, 0)

		local don_phase = Effect.GlobalEffect()
		don_phase:SetType(EFFECT_TYPE_FIELD + EFFECT_TYPE_CONTINUOUS)
		don_phase:SetCode(EVENT_PHASE_START + PHASE_STANDBY)
		don_phase:SetOperation(function()
			R.don_phase(Duel.GetTurnPlayer())
		end)
		Duel.RegisterEffect(don_phase, 0)
	end)
end

return opcg.rules

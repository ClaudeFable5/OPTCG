-- Physical DON!! economy.
-- Every DON is one real card (879999997) and is always an overlay of either:
--   SZONE 0 DON-deck host, SZONE 1 cost-area host, or a leader/character.
opcg = opcg or {}

opcg.DON_CARD_ID = 879999997
opcg.DON_DECK_HOST_ID = 879999998
opcg.DON_COST_HOST_ID = 879999999
opcg.FLAG_DON_RESTED = 0x7f4f0001
opcg.DON_MAX = 10
opcg.ATTACH_DON_DESC = opcg.ATTACH_DON_DESC or 1240
local FLAG_DON_SELF_GIVE = 0x7f4f1242

local function overlay_group(host)
	return host and host:GetOverlayGroup() or nil
end
local function is_don(card)
	return opcg.IsDon and opcg.IsDon(card) or card:GetOriginalCode() == opcg.DON_CARD_ID
end
local function filter_don(card) return is_don(card) end
local function native_rested(card)
	if Card and Card.GetOPCGState then
		return (card:GetOPCGState() & 0x1) ~= 0
	end
	return card:GetFlagEffect(opcg.FLAG_DON_RESTED) > 0
end
local function filter_active(card)
	return is_don(card) and not native_rested(card)
end
local function filter_rested(card)
	return is_don(card) and native_rested(card)
end
local function count(group)
	return group and group:GetCount() or 0
end
local function first_n(group, n, predicate)
	local selected = Group.CreateGroup()
	if not group or n <= 0 then return selected end
	for card in aux.Next(group) do
		if (not predicate or predicate(card)) and selected:GetCount() < n then selected:AddCard(card) end
	end
	return selected
end
local function cannot_set_active(card, player, context)
	if not opcg.EFFECT_CANNOT_SET_DON_ACTIVE then return false end
	if opcg.HasMatchingEffect(card, opcg.EFFECT_CANNOT_SET_DON_ACTIVE) then return true end
	return opcg.contract_ops and opcg.contract_ops.player_has
		and opcg.contract_ops.player_has(player, opcg.EFFECT_CANNOT_SET_DON_ACTIVE, card, context)
end
local function set_rested(card, rested, player)
	player = player or card:GetControler()
	if not rested and cannot_set_active(card, player) then return false end
	if Card and Card.SetOPCGState then
		card:SetOPCGState(rested and 1 or 0)
	end
	card:ResetFlagEffect(opcg.FLAG_DON_RESTED)
	if rested then card:RegisterFlagEffect(opcg.FLAG_DON_RESTED, 0, 0, 1) end
	return true
end
local function set_group_rested(group, rested)
	if not group then return end
	for card in aux.Next(group) do set_rested(card, rested) end
end
local function move_overlay(destination, group)
	if not destination or not group or group:GetCount() == 0 then return 0 end
	local n = group:GetCount()
	Duel.Overlay(destination, group)
	return n
end

function opcg.GetDonDeckHost(player)
	local card = Duel.GetFieldCard(player, LOCATION_SZONE, opcg.zone.DON_DECK.seq)
	if card and (card:GetOriginalCode() == opcg.DON_DECK_HOST_ID or opcg.IsHost(card)) then return card end
	return nil
end
function opcg.GetDonCostHost(player)
	local card = Duel.GetFieldCard(player, LOCATION_SZONE, opcg.zone.DON_COST.seq)
	if card and (card:GetOriginalCode() == opcg.DON_COST_HOST_ID or opcg.IsHost(card)) then return card end
	return nil
end

function opcg.GetAttachedDon(card)
	if not card then return 0 end
	local group = overlay_group(card)
	return group and group:FilterCount(filter_don, nil) or 0
end
function opcg.DonDeckCount(player)
	local group = overlay_group(opcg.GetDonDeckHost(player))
	return group and group:FilterCount(filter_don, nil) or 0
end
function opcg.ActiveDon(player)
	local group = overlay_group(opcg.GetDonCostHost(player))
	return group and group:FilterCount(filter_active, nil) or 0
end
function opcg.RestedDon(player)
	local group = overlay_group(opcg.GetDonCostHost(player))
	return group and group:FilterCount(filter_rested, nil) or 0
end
function opcg.CostAreaDon(player) return opcg.ActiveDon(player) + opcg.RestedDon(player) end
function opcg.IsDonActive(card) return filter_active(card) end
function opcg.IsDonRested(card) return filter_rested(card) end
function opcg.AttachedDonCount(player)
	local total = 0
	local cards = Duel.GetMatchingGroup(function(c)
		return (opcg.IsLeader(c) or opcg.IsCharacter(c)) and c:GetControler() == player
	end, player, LOCATION_MZONE, 0, nil)
	for card in aux.Next(cards) do total = total + opcg.GetAttachedDon(card) end
	return total
end
function opcg.FieldDon(player) return opcg.CostAreaDon(player) + opcg.AttachedDonCount(player) end
function opcg.TotalDon(player) return opcg.DonDeckCount(player) + opcg.FieldDon(player) end
function opcg.GetFieldDonGroup(player, state)
	local result = Group.CreateGroup()
	local cost_group = overlay_group(opcg.GetDonCostHost(player))
	if cost_group then
		for card in aux.Next(cost_group) do
			if is_don(card) and (state == nil or (state == "ACTIVE" and filter_active(card))
				or (state == "RESTED" and filter_rested(card))) then result:AddCard(card) end
		end
	end
	local cards = Duel.GetMatchingGroup(function(c)
		return (opcg.IsLeader(c) or opcg.IsCharacter(c)) and c:GetControler() == player
	end, player, LOCATION_MZONE, 0, nil)
	for host in aux.Next(cards) do
		local attached = overlay_group(host)
		if attached and state == nil then
			for card in aux.Next(attached) do if is_don(card) then result:AddCard(card) end end
		end
	end
	return result
end

-- The host card scripts (c879999998/999) intermittently fail to load in-core
-- ("attempt to call an error function" on initial_effect, interpreter.cpp:351:
-- the token exists but its table has no initial_effect). The token still works,
-- it just misses its protective effects -- so re-register them here whenever
-- they are absent, making that failure mode harmless.
local function harden_host(host)
	if not host or host:IsHasEffect(EFFECT_IMMUNE_EFFECT) then return host end
	local e = Effect.CreateEffect(host)
	e:SetType(EFFECT_TYPE_SINGLE)
	e:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
	e:SetCode(EFFECT_IMMUNE_EFFECT)
	e:SetValue(function() return true end)
	host:RegisterEffect(e)
	local e2 = Effect.CreateEffect(host)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
	e2:SetCode(EFFECT_CANNOT_BE_EFFECT_TARGET)
	e2:SetValue(aux.tgoval)
	host:RegisterEffect(e2)
	return host
end

-- Clicking a cost-area DON gives THAT DON to a leader/character: an
-- overlay-ranged ignition on the physical DON card. Desc 1240 keeps the whole
-- chain wire-silent (core) and fanfare-free (client), same contract as attack's 1157.
local function attach_target_filter(card, player)
	return card:IsLocation(LOCATION_MZONE) and card:GetControler() == player
		and (opcg.IsLeader(card) or opcg.IsCharacter(card))
end
local function register_don_self_give(don)
	if not don or not don.RegisterEffect or not is_don(don) then return end
	if don:GetFlagEffect(FLAG_DON_SELF_GIVE) > 0 then return end
	don:RegisterFlagEffect(FLAG_DON_SELF_GIVE, 0, 0, 1)
	local give = Effect.CreateEffect(don)
	give:SetType(EFFECT_TYPE_IGNITION)
	give:SetRange(LOCATION_OVERLAY)
	give:SetDescription(opcg.ATTACH_DON_DESC)
	give:SetProperty(EFFECT_FLAG_BOTH_SIDE + EFFECT_FLAG_CANNOT_DISABLE + EFFECT_FLAG_UNCOPYABLE)
	give:SetCondition(function(e, tp)
		local handler = e:GetHandler()
		local host = handler.GetOverlayTarget and handler:GetOverlayTarget() or nil
		return host ~= nil and host == opcg.GetDonCostHost(tp)
			and filter_active(handler)
			and Duel.IsExistingMatchingCard(attach_target_filter, tp, LOCATION_MZONE, 0, 1, nil, tp)
	end)
	give:SetTarget(function(e, tp, eg, ep, ev, re, r, rp, chk)
		if chk == 0 then
			return Duel.IsExistingMatchingCard(attach_target_filter, tp, LOCATION_MZONE, 0, 1, nil, tp)
		end
		Duel.SetChainLimit(aux.FALSE)
		local handler = e:GetHandler()
		-- toggle-select: every active cost-area DON is clickable, and the DON
		-- that opened the menu starts already PICKED — so it floats like any
		-- picked DON and can even be walked back before committing
		local pool = Group.CreateGroup()
		local cost_group = overlay_group(opcg.GetDonCostHost(tp))
		if cost_group then
			for card in aux.Next(cost_group) do
				if is_don(card) and filter_active(card) then pool:AddCard(card) end
			end
		end
		local chosen = Group.FromCards(handler)
		if pool:GetCount() > 1 then
			Duel.Hint(HINT_SELECTMSG, tp, opcg.ATTACH_DON_DESC)
			while true do
				local addable = pool:Clone()
				addable:Sub(chosen)
				local pick = addable:SelectUnselect(chosen, tp, true, true)
				if not pick then break end
				if chosen:IsContains(pick) then chosen:RemoveCard(pick)
				else chosen:AddCard(pick) end
			end
		end
		chosen:KeepAlive()
		e:SetLabelObject(chosen)
		if chosen:GetCount() == 0 then return end -- walked everything back = cancel
		-- cancellable: picking NO target calls the whole attach off — the
		-- DON never leave the cost area
		Duel.Hint(HINT_SELECTMSG, tp, opcg.ATTACH_DON_DESC)
		local selected = Duel.SelectMatchingCard(tp, attach_target_filter, tp, LOCATION_MZONE, 0, 0, 1, nil, tp)
		if selected and selected:GetCount() > 0 then Duel.SetTargetCard(selected) end
	end)
	give:SetOperation(function(e, tp)
		local chosen = e:GetLabelObject()
		local target = Duel.GetFirstTarget()
		if target and attach_target_filter(target, tp) and chosen and chosen.GetCount then
			opcg.GiveSpecificDonGroup(tp, target, chosen)
		end
		-- consume the kept label group on every path, cancelled included
		if chosen and chosen.DeleteGroup then chosen:DeleteGroup() end
	end)
	don:RegisterEffect(give)
end

function opcg.SetupDonHosts(player)
	local deck_host = opcg.GetDonDeckHost(player)
	if not deck_host then
		deck_host = Duel.CreateToken(player, opcg.DON_DECK_HOST_ID)
		if not deck_host or not Duel.MoveToField(deck_host, player, player, LOCATION_SZONE,
			POS_FACEUP_ATTACK, true, 1 << opcg.zone.DON_DECK.seq) then return false, "DON_DECK_HOST_FAILED" end
	end
	harden_host(deck_host)
	local cost_host = opcg.GetDonCostHost(player)
	if not cost_host then
		cost_host = Duel.CreateToken(player, opcg.DON_COST_HOST_ID)
		if not cost_host or not Duel.MoveToField(cost_host, player, player, LOCATION_SZONE,
			POS_FACEUP_ATTACK, true, 1 << opcg.zone.DON_COST.seq) then return false, "DON_COST_HOST_FAILED" end
	end
	harden_host(cost_host)

	local missing = opcg.DON_MAX - opcg.TotalDon(player)
	for _ = 1, math.max(0, missing) do
		local don = Duel.CreateToken(player, opcg.DON_CARD_ID)
		if not don then return false, "DON_TOKEN_FAILED" end
		set_rested(don, false, player)
		register_don_self_give(don)
		Duel.Overlay(deck_host, don)
	end
	-- DON that already existed before this call (repeat setups) get the click action too
	for _, host in ipairs({deck_host, cost_host}) do
		local group = overlay_group(host)
		if group then
			for card in aux.Next(group) do
				if is_don(card) then register_don_self_give(card) end
			end
		end
	end
	return opcg.TotalDon(player) == opcg.DON_MAX
end

-- DON deck -> cost area. Newly placed DON is active unless state == "RESTED".
function opcg.AddDon(player, amount, state)
	local deck_host = opcg.GetDonDeckHost(player)
	local cost_host = opcg.GetDonCostHost(player)
	if not deck_host or not cost_host then return 0 end
	local source = overlay_group(deck_host)
	local selected = first_n(source, math.min(amount or 0, count(source)), filter_don)
	set_group_rested(selected, state == "RESTED")
	return move_overlay(cost_host, selected)
end

function opcg.CanRestDon(player, amount) return opcg.ActiveDon(player) >= (amount or 0) end
function opcg.RestDon(player, amount)
	local source = overlay_group(opcg.GetDonCostHost(player))
	if not source then return 0 end
	local selected = first_n(source, amount or 0, filter_active)
	set_group_rested(selected, true)
	return selected:GetCount()
end
function opcg.SetDonActive(player, amount, context)
	local source = overlay_group(opcg.GetDonCostHost(player))
	if not source then return 0 end
	local selected = first_n(source, amount or 0, function(card)
		return filter_rested(card) and not cannot_set_active(card, player, context)
	end)
	set_group_rested(selected, false)
	return selected:GetCount()
end

-- Cost area -> leader/character. State restricts which cost-area DON may move.
function opcg.GiveDon(player, target, amount, state)
	if not target or not (opcg.IsLeader(target) or opcg.IsCharacter(target)) then return 0 end
	local source = overlay_group(opcg.GetDonCostHost(player))
	if not source then return 0 end
	local predicate = filter_don
	if state == "ACTIVE" then predicate = filter_active end
	if state == "RESTED" then predicate = filter_rested end
	local selected = first_n(source, amount or 0, predicate)
	local moved = move_overlay(target, selected)
	if moved > 0 and opcg.contract_ops and opcg.contract_ops.emit then
		opcg.contract_ops.emit("ON_DON_ATTACHED_TO_OWN_FIELD", {
			player=player, event_player=player, event_target=target,
			event_cards=selected, event_count=moved,
		}, player)
	end
	return moved
end

-- Cost area -> leader/character, moving exactly the given DON (click-to-give path).
function opcg.GiveSpecificDon(player, target, don)
	if not don or not is_don(don) then return 0 end
	if not target or not (opcg.IsLeader(target) or opcg.IsCharacter(target)) then return 0 end
	if not don.GetOverlayTarget or don:GetOverlayTarget() ~= opcg.GetDonCostHost(player) then return 0 end
	local selected = Group.FromCards(don)
	local moved = move_overlay(target, selected)
	if moved > 0 and opcg.contract_ops and opcg.contract_ops.emit then
		opcg.contract_ops.emit("ON_DON_ATTACHED_TO_OWN_FIELD", {
			player=player, event_player=player, event_target=target,
			event_cards=selected, event_count=moved,
		}, player)
	end
	return moved
end

-- Cost area -> leader/character, moving exactly the given DON!! group (the
-- multi-select click-to-give path). The whole batch moves as ONE attachment:
-- a single move + a single ON_DON_ATTACHED event with the full count.
function opcg.GiveSpecificDonGroup(player, target, group)
	if not target or not (opcg.IsLeader(target) or opcg.IsCharacter(target)) then return 0 end
	local host = opcg.GetDonCostHost(player)
	if not host then return 0 end
	local selected = Group.CreateGroup()
	for don in aux.Next(group or Group.CreateGroup()) do
		if is_don(don) and don.GetOverlayTarget and don:GetOverlayTarget() == host then
			selected:AddCard(don)
		end
	end
	if selected:GetCount() == 0 then return 0 end
	local moved = move_overlay(target, selected)
	if moved > 0 and opcg.contract_ops and opcg.contract_ops.emit then
		opcg.contract_ops.emit("ON_DON_ATTACHED_TO_OWN_FIELD", {
			player=player, event_player=player, event_target=target,
			event_cards=selected, event_count=moved,
		}, player)
	end
	return moved
end

-- Attached DON -> cost area. A host leaving the field must call this before the engine
-- disposes its overlays; returned DON is rested until Refresh Phase.
function opcg.ReturnAttachedDon(card)
	local destination = card and opcg.GetDonCostHost(card:GetControler()) or nil
	local source = card and overlay_group(card) or nil
	if not destination or not source then return 0 end
	local selected = first_n(source, source:GetCount(), filter_don)
	set_group_rested(selected, true)
	return move_overlay(destination, selected)
end

function opcg.ReturnAttachedDonToCost(card, minimum, maximum, chooser, state)
	if not card then return 0 end
	local destination = opcg.GetDonCostHost(card:GetControler())
	local source = overlay_group(card)
	if not destination or not source then return 0 end
	local candidates = source:Filter(filter_don, nil)
	local max_count = math.min(maximum or minimum or 0, candidates:GetCount())
	local min_count = math.min(minimum or max_count, max_count)
	local selected = chooser ~= nil and candidates:Select(chooser, min_count, max_count, nil)
		or first_n(candidates, max_count, filter_don)
	set_group_rested(selected, state == "RESTED")
	return move_overlay(destination, selected)
end

-- Cost-area DON -> DON deck. Active/rested state is irrelevant in the DON deck.
function opcg.ReturnDon(player, amount, chooser, state, minimum)
	local destination = opcg.GetDonDeckHost(player)
	local source = opcg.GetFieldDonGroup(player, state)
	if not destination or source:GetCount() == 0 then return 0 end
	local maximum = math.min(amount or 0, source:GetCount())
	local required = math.min(minimum or maximum, maximum)
	local selected
	if chooser ~= nil then selected = source:Select(chooser, required, maximum, nil)
	else selected = first_n(source, maximum, filter_don) end
	set_group_rested(selected, false)
	local moved = move_overlay(destination, selected)
	if moved > 0 and opcg.contract_ops and opcg.contract_ops.emit then
		opcg.contract_ops.emit("ON_DON_RETURNED", {
			player=player, event_player=player, event_cards=selected,
			event_count=moved,
		}, player)
	end
	return moved
end

-- Refresh Phase: given DON returns to the cost area, then every cost-area DON becomes active.
function opcg.RefreshDon(player)
	local destination = opcg.GetDonCostHost(player)
	if not destination then return 0 end
	local returned = 0
	local cards = Duel.GetMatchingGroup(function(c)
		return (opcg.IsLeader(c) or opcg.IsCharacter(c)) and c:GetControler() == player
	end, player, LOCATION_MZONE, 0, nil)
	for card in aux.Next(cards) do
		local source = overlay_group(card)
		local selected = source and first_n(source, source:GetCount(), filter_don) or nil
		returned = returned + move_overlay(destination, selected)
	end
	local cost_group = overlay_group(destination)
	set_group_rested(cost_group, false)
	return returned
end

function opcg.DonPhase(player)
	local amount = (Duel.GetTurnCount and Duel.GetTurnCount() == 1) and 1 or 2
	return opcg.AddDon(player, amount, "ACTIVE")
end

return opcg

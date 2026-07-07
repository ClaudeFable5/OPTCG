-- DON!! (879999997) — the OPCG DON!! card.
-- A DON!! attaches to a character or leader as an Xyz material (overlay). While
-- attached, it gives its host +1000 power. Modelled the canonical ygopro way:
-- an EFFECT_TYPE_XMATERIAL effect on the DON card applies to the host monster it
-- is attached to, so N attached DON = +1000 x N (each DON carries its own +1000).
local s, id = GetID()
function s.initial_effect(c)
	local e = Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_XMATERIAL)
	e:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e:SetCode(EFFECT_UPDATE_ATTACK)
	e:SetRange(LOCATION_MZONE)
	-- official rule: an attached DON!! gives +1000 only during YOUR turn.
	-- (the core invokes continuous conditions with exactly ONE arg -- the
	-- effect: effect.cpp check_condition(condition, 1). Get the card from it.)
	e:SetCondition(function(e)
		return Duel.GetTurnPlayer() == e:GetHandler():GetControler()
	end)
	e:SetValue(1000)
	c:RegisterEffect(e)
end

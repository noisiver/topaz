-----------------------------------
-- Swordplay
-- +25% Subtle Blow
-- -48% spell interrupt chance.
-- Parry rate based on shield skill
-- (Shield Skill / 60) * 5
-- Cannot block attacks.
-----------------------------------
require("scripts/globals/status")
function onEffectGain(target, effect)
    target:addMod(tpz.mod.SUBTLE_BLOW, 25)
    target:addMod(tpz.mod.SPELLINTERRUPT, 48)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.SUBTLE_BLOW, 25)
    target:delMod(tpz.mod.SPELLINTERRUPT, 48)
end

-----------------------------------
--
-- tpz.effect.CHAINSPELL
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.UFASTCAST, 150)
    target:addMod(tpz.mod.SPELLINTERRUPT, 300)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.UFASTCAST, 150)
    target:delMod(tpz.mod.SPELLINTERRUPT, 300)
end

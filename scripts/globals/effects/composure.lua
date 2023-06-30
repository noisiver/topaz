-----------------------------------
-- Composure
-- Increases accuracy and lengthens recast time. Enhancement effects gained through white
-- and black magic you cast on yourself last longer.
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ACC, 15)
    target:addMod(tpz.mod.ENSPELL_MACC, 30)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ACC, 15)
    target:delMod(tpz.mod.ENSPELL_MACC, 30)
end

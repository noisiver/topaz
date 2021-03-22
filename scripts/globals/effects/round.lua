-----------------------------------
--
-- tpz.effect.ROUND
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.CURSERESTRAIT, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.CURSERESTRAIT, effect:getPower())
end

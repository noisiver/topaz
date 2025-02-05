-----------------------------------
--
-- tpz.effect.BARSLEEP
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.SLEEPRESTRAIT, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.SLEEPRESTRAIT, effect:getPower())
end

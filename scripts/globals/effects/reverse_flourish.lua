-----------------------------------
--
--     tpz.effect.REVERSE_FLOURISH
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addTP(1000)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delTP(1000)
end

-----------------------------------
--
--     tpz.effect.SUPER_BUFF
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local power = effect:getPower()
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local power = effect:getPower()
end

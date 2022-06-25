-----------------------------------
--
-- tpz.effect.GEO_EVASION_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local power = math.min(effect:getPower(), target:getStat(tpz.mod.EVA))
    effect:setPower(power)
    target:delMod(tpz.mod.EVA, power)
end


function onEffectTick(target, effect)
end


function onEffectLose(target, effect)
    local power = effect:getPower()
    target:addMod(tpz.mod.EVA, power)
end

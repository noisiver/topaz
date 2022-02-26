-----------------------------------
--
--     tpz.effect.DODGE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.EVA, effect:getPower())
    target:addMod(tpz.mod.GUARD_PERCENT, 50)
    target:addMod(tpz.mod.INQUARTATA, 15)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.EVA, effect:getPower())
    target:delMod(tpz.mod.GUARD_PERCENT, 50)
    target:delMod(tpz.mod.INQUARTATA, 15)
end

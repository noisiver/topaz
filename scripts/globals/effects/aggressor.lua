-----------------------------------
--
-- tpz.effect.AGGRESSOR
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local jpLevel = target:getJobPointLevel(tpz.jp.AGGRESSOR_EFFECT)

    target:addMod(tpz.mod.RACC, effect:getPower() + jpLevel)
    target:addMod(tpz.mod.ACC, 25 + jpLevel)
    target:addMod(tpz.mod.EVA, -25)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpLevel = target:getJobPointLevel(tpz.jp.AGGRESSOR_EFFECT)

    target:delMod(tpz.mod.RACC, effect:getPower() + jpLevel)
    target:delMod(tpz.mod.ACC, 25 + jpLevel)
    target:delMod(tpz.mod.EVA, -25)
end

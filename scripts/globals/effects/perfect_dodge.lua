-----------------------------------
--
--     tpz.effect.PERFECT_DODGE
--
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.PERFECT_DODGE_EFFECT)

    target:addMod(tpz.mod.MEVA, jpValue * 3)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.PERFECT_DODGE_EFFECT)

    target:delMod(tpz.mod.MEVA, jpValue * 3)
end

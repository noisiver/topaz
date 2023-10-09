-----------------------------------
--
--  tpz.effect.UNLIMITED_SHOT
--
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.UNLIMITED_SHOT_EFFECT)

    target:addMod(tpz.mod.ENMITY, -2 * jpValue)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.UNLIMITED_SHOT_EFFECT)

    target:delMod(tpz.mod.ENMITY, -2 * jpValue)
end

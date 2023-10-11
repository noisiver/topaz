-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.MIKAGE_EFFECT) * 3

    target:addMod(tpz.mod.ATT, jpValue)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.MIKAGE_EFFECT) * 3

    target:delMod(tpz.mod.ATT, jpValue)
end

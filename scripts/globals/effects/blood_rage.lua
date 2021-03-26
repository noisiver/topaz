-----------------------------------
--
--      tpz.effect.BLOOD_RAGE
--
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.CURE_POTENCY_RCVD, effect:getPower())
    target:addMod(tpz.mod.ENMITY, effect:getSubPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.CURE_POTENCY_RCVD, effect:getPower())
    target:delMod(tpz.mod.ENMITY, effect:getSubPower())
end

-----------------------------------
--
-- tpz.effect.MULTI_STRIKES
--
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.DOUBLE_ATTACK, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.DOUBLE_ATTACK, effect:getPower())
end

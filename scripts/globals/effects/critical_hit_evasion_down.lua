-----------------------------------
--
--  tpz.effect.CRITICAL_HIT_EVASION_DOWN
--
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.CRITICAL_HIT_EVASION_DOWN, -effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.CRITICAL_HIT_EVASION_DOWN, -effect:getPower())
end

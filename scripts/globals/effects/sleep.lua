-----------------------------------
-- Sleep
--
--
-----------------------------------

function onEffectGain(target, effect)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delStatusEffect(tpz.effect.DEEPSLEEP)
end

-----------------------------------
--
--     tpz.effect.PRESTO
--     
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.STEP_ACCURACY, 50)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.STEP_ACCURACY, 50)
end

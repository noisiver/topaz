-----------------------------------
--
--     tpz.effect.PRESTO
--     
-----------------------------------
function onEffectGain(target, effect)
    player:addMod(tpz.mod.STEP_ACCURACY, 50)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    player:delMod(tpz.mod.STEP_ACCURACY, 50)
end

-----------------------------------
--
--   tpz.effect.BEWILDERED_DAZE_3
--
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.ENEMYCRITRATE, -9)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ENEMYCRITRATE, -9)
end

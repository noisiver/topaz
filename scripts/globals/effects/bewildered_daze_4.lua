-----------------------------------
--
--   tpz.effect.BEWILDERED_DAZE_4
--
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.ENEMYCRITRATE, -11)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ENEMYCRITRATE, -11)
end

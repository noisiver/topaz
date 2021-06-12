-----------------------------------
--
--tpz.effect.CONVERGENCE
--
-----------------------------------
function onEffectGain(target, effect)
   target:addMod(tpz.mod.MATTK, effect:getPower())
   target:addMod(tpz.mod.MACC, effect:getPower()))
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MATTK, effect:getPower())
    target:delMod(tpz.mod.MACC, effect:getPower())
end

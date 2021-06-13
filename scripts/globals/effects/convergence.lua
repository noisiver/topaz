-----------------------------------
--
--tpz.effect.CONVERGENCE
--
-----------------------------------
function onEffectGain(target, effect)
   target:addMod(tpz.mod.MATT, 25)
   target:addMod(tpz.mod.MACC, 25)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MATT, 25)
    target:delMod(tpz.mod.MACC, 25)
end

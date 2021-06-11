-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ACC, 100) 
    target:addMod(tpz.mod.MACC, 100)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ACC, 100) 
    target:delMod(tpz.mod.MACC, 100)
end

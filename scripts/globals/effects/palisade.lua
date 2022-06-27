-----------------------------------
--
--     tpz.effect.PALISADE
--     +100% defense for 1 minute
-----------------------------------
function onEffectGain(target, effect)
	target:addMod(tpz.mod.DEFP, 100)
    target:addMod(tpz.mod.ENMITY_LOSS_REDUCTION, 100)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.DEFP, 100)
    target:delMod(tpz.mod.ENMITY_LOSS_REDUCTION, 100)
end

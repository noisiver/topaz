-----------------------------------
--
--     tpz.effect.DIVINE_EMBLEM
--     
-----------------------------------
function onEffectGain(target, effect)
   target:addMod(tpz.mod.MACC, 100)
   target:addMod(tpz.mod.MAG_BURST_BONUS, 50)
   target:addMod(tpz.mod.ENMITY, 100)
   target:addMod(tpz.mod.MATT, 50)
   target:addMod(tpz.mod.CURE_POTENCY_II, 25)
   target:addMod(tpz.mod.NO_SPELL_MP_DEPLETION, 100)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MACC, 100)
	target:delMod(tpz.mod.MAG_BURST_BONUS, 50)
	target:delMod(tpz.mod.ENMITY, 100)
	target:delMod(tpz.mod.MATT, 50)
	target:delMod(tpz.mod.CURE_POTENCY_II, 25)
	target:delMod(tpz.mod.NO_SPELL_MP_DEPLETION, 100)
end

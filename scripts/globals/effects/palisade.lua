-----------------------------------
--
--     tpz.effect.PALISADE
--     
-----------------------------------
function onEffectGain(target, effect)
	target:addMod(tpz.mod.ABSORB_PHYSDMG_TO_MP, 100)
	target:addMod(tpz.mod.SHIELDBLOCKRATE, -100)
	target:addMod(tpz.mod.INQUARTATA, -100)
	target:addMod(tpz.mod.EVA, -300)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ABSORB_PHYSDMG_TO_MP, 100)
	target:delMod(tpz.mod.SHIELDBLOCKRATE, -100)
	target:delMod(tpz.mod.INQUARTATA, -100)
	target:delMod(tpz.mod.EVA, -300)
end

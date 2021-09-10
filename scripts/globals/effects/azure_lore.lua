-----------------------------------
--
-- tpz.effect.AZURE_LORE
--
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.STR, 20)
	target:addMod(tpz.mod.DEX, 20)
	target:addMod(tpz.mod.VIT, 20)
	target:addMod(tpz.mod.AGI, 20)
	target:addMod(tpz.mod.INT, 20)
	target:addMod(tpz.mod.MND, 20)
	target:addMod(tpz.mod.CHR, 20)
	target:addMod(tpz.mod.ACC, 100) 
	target:addMod(tpz.mod.RACC, 100) 
	target:addMod(tpz.mod.MACC, 100)
	target:addMod(tpz.mod.NO_SPELL_MP_DEPLETION, 100)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.STR, 20)
	target:delMod(tpz.mod.DEX, 20)
	target:delMod(tpz.mod.VIT, 20)
	target:delMod(tpz.mod.AGI, 20)
	target:delMod(tpz.mod.INT, 20)
	target:delMod(tpz.mod.MND, 20)
	target:delMod(tpz.mod.CHR, 20)
    target:delMod(tpz.mod.ACC, 100) 
    target:delMod(tpz.mod.RACC, 100) 
    target:delMod(tpz.mod.MACC, 100)
	target:delMod(tpz.mod.NO_SPELL_MP_DEPLETION, 100)
end

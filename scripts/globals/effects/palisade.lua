-----------------------------------
--
--     tpz.effect.PALISADE
--     100% of damage taken goes to MP
--     Can't evade, block, guard, parry, or counter
--     Handled in C++
-----------------------------------
function onEffectGain(target, effect)
	target:addMod(tpz.mod.ABSORB_PHYSDMG_TO_MP, 100)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ABSORB_PHYSDMG_TO_MP, 100)
end

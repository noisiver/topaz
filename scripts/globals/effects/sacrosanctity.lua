-----------------------------------
--
--     tpz.effect.SACROSANCTITY
--
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.ATTP, 25)
    target:addMod(tpz.mod.ACC, 25)
    target:addMod(tpz.mod.HASTE_ABILITY, 1500)
    target:addMod(tpz.mod.CURE_POTENCY, -50)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ATTP, 25)
    target:delMod(tpz.mod.ACC, 25)
    target:delMod(tpz.mod.HASTE_ABILITY, 1500)
    target:delMod(tpz.mod.CURE_POTENCY, -50)
end

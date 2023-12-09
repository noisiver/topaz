-----------------------------------
--
--     tpz.effect.ASYLUM
--
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.STATUSRESTRAIT, 40)
    target:addMod(tpz.mod.DISPELRESTRAIT, 40)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.STATUSRESTRAIT, 40)
    target:delMod(tpz.mod.DISPELRESTRAIT, 40)
end

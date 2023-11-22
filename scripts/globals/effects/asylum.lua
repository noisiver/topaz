-----------------------------------
--
--     tpz.effect.ASYLUM
--
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.STATUSRESTRAIT, 25)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.STATUSRESTRAIT, 25)
end

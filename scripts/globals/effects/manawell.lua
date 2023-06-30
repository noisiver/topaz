-----------------------------------
--
--     tpz.effect.MANAWELL
--
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.REFRESH, 400)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.REFRESH, 400)
end

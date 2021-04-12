-----------------------------------
--
--     tpz.effect.MEIKYO_SHISUI
--
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.STORETP, -1000)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.STORETP, -1000)
end

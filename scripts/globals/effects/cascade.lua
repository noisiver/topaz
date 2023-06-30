-----------------------------------
--
--     tpz.effect.CASCADE
--
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.MAGIC_DAMAGE, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MAGIC_DAMAGE, effect:getPower())
end

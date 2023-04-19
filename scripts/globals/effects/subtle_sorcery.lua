-----------------------------------
--
--     tpz.effect.SUBTLE_SORCERY
--
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.MATT, 40)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MATT, 40)
end

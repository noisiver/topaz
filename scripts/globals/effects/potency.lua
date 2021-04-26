-----------------------------------
--
--tpz.effect.POTENCY
--
-----------------------------------

function onEffectGain(target, effect)
    if (effect:getPower()>100) then
        effect:setPower(100)
    end
    target:addMod(tpz.mod.CRITHITRATE, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.CRITHITRATE, effect:getPower())
end

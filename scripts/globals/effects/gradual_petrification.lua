-----------------------------------
--
--tpz.effect.GRADUAL_PETRIFICATION
--
-----------------------------------

function onEffectGain(target, effect)
    -- minimum time is 10 seconds!
    if (effect:getPower() < 10) then
        effect:setPower(10)
    end
end

function onEffectTick(target, effect)
    local remainingTicks = 1 + (effect:getTimeRemaining() / 1000) / 3
end

function onEffectLose(target, effect)
    if (effect:getTimeRemaining() == 0) then
        target:addStatusEffect(tpz.effect.PETRIFICATION, 1, 0, 60)
    end
end

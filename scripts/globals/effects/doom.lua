-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target, effect)
    -- minimum time is 10 seconds!
    if (effect:getPower() < 5) then
        effect:setPower(5)
    end
end

function onEffectTick(target, effect)
    local remainingTicks = 1 + (effect:getTimeRemaining() / 1000) / 3

    if (effect:getDuration() == 10) then -- 10 second timer counts down differently
        remainingTicks =  (effect:getTimeRemaining() / 1000) 
    end
    -- doom counter
    target:messagePublic(112, target, remainingTicks, remainingTicks)
end

function onEffectLose(target, effect)
    if (effect:getTimeRemaining() == 0) then
        target:setHP(0)
    end
end

-----------------------------------
--
--tpz.effect.GRADUAL_PETRIFICATION
--
-----------------------------------

function onEffectGain(target, effect)
    -- Store targets movement speed to reapply later
    target:setLocalVar("movementSpeed", target:getMod(tpz.mod.MOVE))
    -- minimum time is 10 seconds!
    if (effect:getPower() < 10) then
        effect:setPower(10)
    end
end

function onEffectTick(target, effect)
    local remainingTicks = 1 + (effect:getTimeRemaining() / 1000) / 3
    -- the effect restore accuracy of 1 every 3 ticks.
    local movementDecrease = effect:getPower()
    if (movementDecrease > 0) then
        effect:setPower(movementDecrease - 1)
        target:addMod(tpz.mod.MOVE, -5)
    end
    -- Petrification countdown message
    target:messagePublic(530, target, remainingTicks, remainingTicks)
end

function onEffectLose(target, effect)
    if (effect:getTimeRemaining() == 0) then
        -- Set movement speed back to what it was before applying this effect, then petrify
        target:addStatusEffect(tpz.effect.PETRIFICATION, 1, 0, 60)
    end
    target:setMod(tpz.mod.MOVE, target:getLocalVar("movementSpeed"))
end

-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target, effect)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    -- Set movement speed back if petrified mid gradual petrificatioin(Safety Check)
    if target:getLocalVar("movementSpeed") > 0 then
        target:setMod(tpz.mod.MOVE, target:getLocalVar("movementSpeed"))
    end
end

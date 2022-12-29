-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local IgnisRunes = target:getLocalVar("IgnisRunes")
    IgnisRunes = IgnisRunes + 1
    target:setLocalVar("IgnisRunes", IgnisRunes)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local IgnisRunes = target:getLocalVar("IgnisRunes")
    IgnisRunes = IgnisRunes - 1
    target:setLocalVar("IgnisRunes", IgnisRunes)
end

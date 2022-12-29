-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local LuxRunes = target:getLocalVar("LuxRunes")
    LuxRunes = LuxRunes + 1
    target:setLocalVar("LuxRunes", LuxRunes)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local LuxRunes = target:getLocalVar("LuxRunes")
    LuxRunes = LuxRunes - 1
    target:setLocalVar("LuxRunes", LuxRunes)
end

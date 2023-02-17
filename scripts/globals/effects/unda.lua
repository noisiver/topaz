-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local UndaRunes = target:getLocalVar("UndaRunes")
    UndaRunes = UndaRunes + 1
    target:setLocalVar("UndaRunes", UndaRunes)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local UndaRunes = target:getLocalVar("UndaRunes")
    UndaRunes = UndaRunes - 1
    target:setLocalVar("UndaRunes", UndaRunes)
end

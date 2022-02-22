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
    target:addMod(tpz.mod.STORETP, 10)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local UndaRunes = target:getLocalVar("UndaRunes")
    UndaRunes = UndaRunes - 1
    target:setLocalVar("UndaRunes", UndaRunes)
    target:delMod(tpz.mod.STORETP, 10)
end

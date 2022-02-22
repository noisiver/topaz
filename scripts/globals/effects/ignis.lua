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
    target:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, 10)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local IgnisRunes = target:getLocalVar("IgnisRunes")
    IgnisRunes = IgnisRunes - 1
    target:setLocalVar("IgnisRunes", IgnisRunes)
    target:delMod(tpz.mod.ALL_WSDMG_ALL_HITS, 10)
end

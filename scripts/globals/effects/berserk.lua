-----------------------------------
--
-- tpz.effect.BERSERK
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local power = effect:getPower()
    local subPower = effect:getSubPower()
    target:addMod(tpz.mod.ATTP, power)
    target:addMod(tpz.mod.RATTP, power)
    target:addMod(tpz.mod.DEFP, -subPower)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local power = effect:getPower()
    local subPower = effect:getSubPower()
    target:delMod(tpz.mod.ATTP, power)
    target:delMod(tpz.mod.RATTP, power)
    target:delMod(tpz.mod.DEFP, -subPower)
end

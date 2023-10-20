-----------------------------------
--
-- tpz.effect.MIGHTY_GUARD
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local power = effect:getPower()
    local subPower = effect:getSubPower()
    target:addMod(tpz.mod.DEFP, power)
    target:addMod(tpz.mod.HASTE_MAGIC, subPower * 100)
    target:addMod(tpz.mod.REGEN, subPower * 2)
    target:addMod(tpz.mod.MDEF, subPower)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local power = effect:getPower()
    local subPower = effect:getSubPower()
    target:delMod(tpz.mod.DEFP, power)
    target:delMod(tpz.mod.HASTE_MAGIC, subPower * 100)
    target:delMod(tpz.mod.REGEN, subPower * 2)
    target:delMod(tpz.mod.MDEF, subPower)
end

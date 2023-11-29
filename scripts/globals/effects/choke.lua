-----------------------------------
--
-- tpz.effect.CHOKE
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target, effect)
    local subPower = effect:getSubPower()
    if (subPower == nil) or (subPower == 0) then
        subPower = getElementalDebuffStatDownFromDOT(effect:getPower())
    end
    target:addMod(tpz.mod.REGEN_DOWN, effect:getPower())
    target:addMod(tpz.mod.VIT, -subPower)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local subPower = effect:getSubPower()
    if (subPower == nil) or (subPower == 0) then
        subPower = getElementalDebuffStatDownFromDOT(effect:getPower())
    end
    target:delMod(tpz.mod.REGEN_DOWN, effect:getPower())
    target:delMod(tpz.mod.VIT, -subPower)
end

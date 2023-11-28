-----------------------------------
--
--     tpz.effect.RASP
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target, effect)
    local subpower = effect:getSubPower()
    if (subpower == nil) then
        subpower = getElementalDebuffStatDownFromDOT(effect:getPower())
    end
    target:addMod(tpz.mod.REGEN_DOWN, effect:getPower())
    target:addMod(tpz.mod.DEX, -subPower)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local subpower = effect:getSubPower()
    if (subpower == nil) then
        subpower = getElementalDebuffStatDownFromDOT(effect:getPower())
    end
    target:delMod(tpz.mod.REGEN_DOWN, effect:getPower())
    target:delMod(tpz.mod.DEX, -subPower)
end

-----------------------------------
--
--     tpz.effect.PROTECT
--
-- 9653 power sets mobs DMGPHYS to 0. This is used for qutrubs fortifying wail.
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local power = effect:getPower()
    if (power == 9653) then
        target:setMod(tpz.mod.UDMGPHYS, 0)
    else
        target:addMod(tpz.mod.DEF, effect:getPower())
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local power = effect:getPower()
    if (power == 9653) then
        target:setMod(tpz.mod.UDMGPHYS, 200)
    else
        target:delMod(tpz.mod.DEF, effect:getPower())
    end
end

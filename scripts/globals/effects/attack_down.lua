-----------------------------------
--
-- tpz.effect.ATTACK_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    if (effect:getPower()>100) then
        effect:setPower(100)
    end
    target:addMod(tpz.mod.ATTP, -effect:getPower())
    target:addMod(tpz.mod.RATTP, -effect:getPower())
    -- Weapon break weapon damage down effect
    if (effect:getSubPower() > 0) then
        target:addMod(tpz.mod.MAIN_DMG_RATING, -effect:getSubPower())
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ATTP, -effect:getPower())
    target:delMod(tpz.mod.RATTP, -effect:getPower())
    if (effect:getSubPower() > 0) then
        target:delMod(tpz.mod.MAIN_DMG_RATING, -effect:getSubPower())
    end
end

-----------------------------------------
-- ID: 4127
-- Item: Max-Potion +3
-- Item Effect: Restores 1300 HP
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    if (target:getHP() == target:getMaxHP()) then
        return tpz.msg.basic.ITEM_UNABLE_TO_USE
    elseif (target:hasStatusEffect(tpz.effect.MEDICINE)) then
        return tpz.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

function onItemUse(target)
    target:messageBasic(tpz.msg.basic.RECOVERS_HP, 0, target:addHP(1300*ITEM_POWER))
    target:addStatusEffect(tpz.effect.MEDICINE, 0, 0, 180)
end

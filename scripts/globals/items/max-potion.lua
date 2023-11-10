-----------------------------------------
-- ID: 4124
-- Item: Max-Potion
-- Item Effect: Restores 1000 HP
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

function onItemUse(target, item)
    target:messageBasic(tpz.msg.basic.RECOVERS_HP, 0, target:addHP(item:getParam()*ITEM_POWER))
    target:addStatusEffect(tpz.effect.MEDICINE, 0, 0, 180)
 end

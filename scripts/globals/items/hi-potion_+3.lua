-----------------------------------------
-- ID: 4119
-- Item: Hi-Potion +3
-- Item Effect: Restores 265 HP
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
    target:messageBasic(tpz.msg.basic.RECOVERS_HP, 0, target:addHP(265*ITEM_POWER))
end

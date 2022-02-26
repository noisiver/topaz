-----------------------------------------
-- ID: 5832
-- Item: Healing Mist
-- Item Effect: Restores 600 HP to nearby allies
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")

function onItemCheck(target)
    if target:getHP() == target:getMaxHP() then
        return tpz.msg.basic.ITEM_UNABLE_TO_USE
    end
    return 0
end

function onItemUse(target)
    target:messageBasic(tpz.msg.basic.RECOVERS_HP, 0, target:addHP(600*ITEM_POWER))
end

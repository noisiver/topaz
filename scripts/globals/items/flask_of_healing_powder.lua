-----------------------------------------
-- ID: 5322
-- Item: Healing Powder
-- Item Effect: Restores 25% HP to all allies
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local amount = math.floor(target:getMaxHP() * 0.25)
    target:messageBasic(tpz.msg.basic.RECOVERS_HP, 0, target:addHP(amount*ITEM_POWER))
end

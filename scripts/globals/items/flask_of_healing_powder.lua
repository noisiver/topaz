-----------------------------------------
-- ID: 5322
-- Item: Healing Powder
-- Item Effect: Restores 25% HP to all allies
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
    local amount = math.floor(target:getMaxHP() * 0.25)
    target:messageBasic(tpz.msg.basic.RECOVERS_HP, 0, target:addHP(amount*ITEM_POWER))
end

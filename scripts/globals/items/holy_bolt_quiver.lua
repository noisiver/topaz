-----------------------------------------
-- ID: 5336
-- Holy Bolt Quiver
-- When used, you will obtain one stack of Holy Bolts
-----------------------------------------
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = tpz.msg.basic.ITEM_NO_USE_INVENTORY
    end
    return result
end

function onItemUse(target)
    target:addItem(18153, 99)
    local ID = zones[target:getZoneID()]
    target:messageSpecial(ID.text.ITEM_OBTAINED, 18153)
end

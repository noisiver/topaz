-----------------------------------------
-- ID: 5309
-- Toolbag Tsura
-- When used, you will obtain one stack of tsurara
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
    target:addItem(1164, 99)
    local ID = zones[target:getZoneID()]
    target:messageSpecial(ID.text.ITEM_OBTAINED, 1164)
end


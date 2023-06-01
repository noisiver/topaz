-----------------------------------------
-- ID: 5440
-- Dusty Wing
-- Increases TP of the user by 300
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/items")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addTP(3000)
    target:messageBasic(tpz.msg.basic.TP_INCREASE, tpz.items.DUSTY_WING, player:getTP())
end

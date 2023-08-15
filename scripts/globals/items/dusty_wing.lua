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
    local tp = 3000
    target:addTP(tp)
    target:messageBasic(tpz.msg.basic.PLAYER_REGAIN_TP, target, tp)
end

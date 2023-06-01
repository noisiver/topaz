-----------------------------------------
-- ID: 4202
-- Daedalus Wing
-- Increases TP of the user by 100
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/items")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
	local tp = (1000 * (100 + target:getMod(tpz.mod.STORETP))) / 100
    target:addTP(tp)
    target:messageBasic(tpz.msg.basic.TP_INCREASE, tpz.items.DAEDALUS_WING, player:getTP())
end

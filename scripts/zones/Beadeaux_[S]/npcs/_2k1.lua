-----------------------------------
-- Area: Beadeaux_[S]
-- Quadav Charm gate
-- !gotoid 17154804
-----------------------------------
local ID = require("scripts/zones/Beadeaux_[S]/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/items")
-----------------------------------

function onTrigger(player, npc)
    if player:getXPos() < 40 then
        player:messageSpecial(ID.text.EMPTY_SOCKET)
    else
        npc:openDoor()
    end
end

function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, tpz.items.QUADAV_CHARM, true) then
        npc:openDoor()
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, eventid, result, door)
end
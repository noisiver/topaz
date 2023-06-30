-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: Strange Apparatus
-- !pos 375 20 -259 198
-----------------------------------
local ID = require("scripts/zones/Maze_of_Shakhrami/IDs")
require("scripts/globals/items")
require("scripts/globals/utils")
require("scripts/globals/npc_util")
-----------------------------------



function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, tpz.items.YELLOW_CHIP) then
        if npcUtil.popFromQM(player, npc, ID.mob.BALPAH) then 
            utils.ShowTextParty(player, ID.text.SYS_OVERLOAD)
            utils.MessageParty(player, "You have angered the beasts.", 0, "Balpah")
            player:confirmTrade()
        end
    end
end

function onTrigger(player, npc)
    utils.ShowTextParty(player, ID.text.DEVICE_NOT_WORKING)
end


function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

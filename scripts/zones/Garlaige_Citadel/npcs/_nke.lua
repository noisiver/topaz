-----------------------------------
-- Area: Garlaige Citadel
--  NPC: Strange Apparatus
-- !pos 255 0 19 200
-----------------------------------
local ID = require("scripts/zones/Garlaige_Citadel/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, 475) then -- Blue Chip
        if npcUtil.popFromQM(player, npc, ID.mob.CYRANUCE_M_CUTAULEON) then -- items and mob id here under mob = in IDs.lua
            player:messageSpecial(ID.text.SYS_OVERLOAD)
            player:PrintToPlayer("Somewhere, a dragon with the holy crest exists. Do you believe in it?",0,"Cyranuce")
            player:confirmTrade()
        end
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.DEVICE_NOT_WORKING) -- put special message when clicking ??? here from IDs.lua of the zone
end


function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

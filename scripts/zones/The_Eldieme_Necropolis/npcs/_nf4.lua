-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Strange Apparatus
-- !pos 104 0 -179 195
local ID = require("scripts/zones/The_Eldieme_Necropolis/IDs")
require("scripts/globals/npc_util")
-----------------------------------
function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, 478) then -- Clear Chip
        if npcUtil.popFromQM(player, npc, ID.mob.MURGLEIS) then -- items and mob id here under mob = in IDs.lua
            player:messageSpecial(ID.text.SYS_OVERLOAD)
            player:PrintToPlayer("Why has a mere mortal awakened me from my slumber?",0,"Murgleis")
            player:confirmTrade()
        end
    elseif npcUtil.tradeHasExactly(trade, 480) then -- White Chip
        if npcUtil.popFromQM(player, npc, ID.mob.BURTGANG) then -- items and mob id here under mob = in IDs.lua
            player:messageSpecial(ID.text.SYS_OVERLOAD)
            player:PrintToPlayer("You will not defile this holy place!",0,"Burtgang")
            player:confirmTrade()
        end
    elseif npcUtil.tradeHasExactly(trade, 475) then -- Blue Chip
        if npcUtil.popFromQM(player, npc, ID.mob.TIZONA) then -- items and mob id here under mob = in IDs.lua
            player:messageSpecial(ID.text.SYS_OVERLOAD)
            player:PrintToPlayer("You shall bow before the immortals.",0,"Raubahn")
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

-----------------------------------
-- Area: Ordelle's Caves
--  NPC: Strange Apparatus
-- !pos -294 28 -100 193
-----------------------------------
local ID = require("scripts/zones/Ordelles_Caves/IDs")
require("scripts/globals/npc_util")
-----------------------------------



function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, 481) then -- Black Chip
        if npcUtil.popFromQM(player, npc, ID.mob.ZEID) then 
            player:showText(npc, ID.text.SYS_OVERLOAD)
            player:PrintToPlayer("You have much left to learn.",0,"Zeid")
            player:confirmTrade()
        end
	elseif npcUtil.tradeHasExactly(trade, 474) then -- Red Chip
        if npcUtil.popFromQM(player, npc, ID.mob.IRON_EATER) then 
            player:showText(npc, ID.text.SYS_OVERLOAD)
            player:PrintToPlayer("You dare challgenge a mythril muskteer?",0,"Iron Eater")
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

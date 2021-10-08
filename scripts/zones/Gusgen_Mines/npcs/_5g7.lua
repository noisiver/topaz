-----------------------------------
-- Area: Gusgen Mines
--  NPC: Strange Apparatus
-- !pos 219 -39 255 196
-----------------------------------
local ID = require("scripts/zones/Gusgen_Mines/IDs")
require("scripts/globals/npc_util")
-----------------------------------



function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, 474) then -- Red Chip
      --  print("we got an item, boss!")
        if npcUtil.popFromQM(player, npc, ID.mob.NAGI) then -- items and mob id here under mob = in IDs.lua
           -- print("we can pop the mob, boss!")
            player:showText(npc, ID.text.SYS_OVERLOAD)
            player:PrintToPlayer("My blade seeks vengeance!",0,"Nagi")
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
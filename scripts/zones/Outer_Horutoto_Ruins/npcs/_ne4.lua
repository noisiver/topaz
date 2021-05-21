-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: Strange Apparatus
-- !pos -574 0 739 194
-----------------------------------
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs")
require("scripts/globals/npc_util")
-----------------------------------



function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, 479) then -- Purple Chip
      --  print("we got an item, boss!")
        if npcUtil.popFromQM(player, npc, ID.mob.GOBLIN_TOMB_RAIDER) then -- items and mob id here under mob = in IDs.lua
           -- print("we can pop the mob, boss!")
            player:messageSpecial(ID.text.SYS_OVERLOAD)
            player:PrintToPlayer("The shiny dagger belongs to me!",0,"Goblin")
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

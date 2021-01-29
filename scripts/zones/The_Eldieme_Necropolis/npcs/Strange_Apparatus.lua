-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Strange Apparatus
-- !pos 104 0 -179 195
local ID = require("scripts/zones/The_Eldieme_Necropolis/IDs")
require("scripts/globals/npc_util")
-----------------------------------



function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, {16547, 1425}) and npcUtil.popFromQM(player, npc, ID.mob.GENBU) then -- items and mob id here under mob = in IDs.lua
        player:showText(npc, ID.text.SKY_GOD_OFFSET + 5)
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.SKY_GOD_OFFSET) -- put special message when clicking ??? here from IDs.lua of the zone
end


function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: ??? (qm1) - Morion Worm spawn
-- !pos 254.652 -6.039 20.878 173
-----------------------------------
local ID = require("scripts/zones/The_Eldieme_Necropolis/IDs")
require("scripts/zones/The_Eldieme_Necropolis/globals")
require("scripts/globals/npc_util")
-----------------------------------


function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, 768) then -- Flint Stone
        if npcUtil.popFromQM(player, npc, ID.mob.SKULL_OF_GLUTTONY) then -- items and mob id here under mob = in IDs.lua
            player:messageSpecial(npc, ID.text.THE_BRAZIER_IS_LIT)
            player:confirmTrade()
        end
    end
end

function onTrigger(player, npc)
    player:messageSpecial(npc, ID.text.SENSE_OF_FOREBODING)
end

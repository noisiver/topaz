-----------------------------------
-- Area: Windurst Woods
--  NPC: Robino-Mobino
-- Chocobo Silks NPC
-- !gotoid 17281610
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/chocobo_digging")
-----------------------------------
function onTrade(player, npc, trade) 
    chocoboDig.chocoboDig.onTradeNPC(player, npc, trade)
end

function onTrigger(player, npc)
    tpz.chocoboDig.onTriggerNPC(player, npc)
end
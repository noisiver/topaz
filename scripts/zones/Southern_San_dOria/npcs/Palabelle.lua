-----------------------------------
-- Area: Windurst Woods
--  NPC: Palabelle
-- Chocobo Silks NPC
-- !gotoid 17719606
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/chocobo_digging")
-----------------------------------
function onTrade(player, npc, trade) 
    chocoboDig.chocoboDig.onTradeNPC(player, npc, trade)
end

function onTrigger(player, npc)
    tpz.chocoboDig.onTriggerNPC(player, npc)
end
-----------------------------------
-- Area: Bastok Mines
--  NPC: Gavoroi
-- Chocobo Silks NPC
-- !gotoid 17735854
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/chocobo_digging")
-----------------------------------
function onTrade(player, npc, trade) 
    chocoboDig.chocoboDig.onTradeNPC(player, npc, trade)
end

function onTrigger(player, npc)
    tpz.chocoboDig.onTriggerNPC(player, npc)
end
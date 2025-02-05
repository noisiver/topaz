-----------------------------------
-- Area: Den of Rancor
--  NPC: ??? - HakuTaku spawn
-- !pos 24 25 -306 160
-----------------------------------
local ID = require("scripts/zones/Den_of_Rancor/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    -- Eye Cluster or all eyes
    if npcUtil.tradeHas(trade, 1298) and npcUtil.popFromQM(player, npc, ID.mob.HAKUTAKU) then
        player:confirmTrade()
    elseif npcUtil.tradeHas(trade, { 1288, 1289, 1290, 1291, 1292 }) and npcUtil.popFromQM(player, npc, ID.mob.HAKUTAKU) then
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
end

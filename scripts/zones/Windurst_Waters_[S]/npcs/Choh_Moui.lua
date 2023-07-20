-----------------------------------
-- Area: Windurst Waters [S]
--  NPC: Maat
-- !pos
-- BST job quest NPC
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs")
require("scripts/globals/jsequests")
-----------------------------------

function onTrade(player, npc, trade)
    -- Abraxas drop 9915
    -- Typhoon Wyvern(Gustav Tunnel) drop 9916
    -- Greater Manticore drop (Cape Terrigan) 9917
    tpz.jsequest.onTrade(player, npc, trade, tpz.job.BST)
end

function onTrigger(player, npc)
    -- JSE quests
    tpz.jsequest.onTrigger(player, npc, tpz.job.BST)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

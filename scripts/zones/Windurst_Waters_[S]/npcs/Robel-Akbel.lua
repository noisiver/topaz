-----------------------------------
-- Area: Windurst Waters [S]
--  NPC: Robel-Akbel
-- !pos
-- BLM job quest NPC
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs")
require("scripts/globals/jsequests")
-----------------------------------

function onTrade(player, npc, trade)
    -- Spartoi Sorcerer drop 9921
    -- Kindred Black Mage (ule range) drop 9922
    -- Wekufe drop 9923
    tpz.jsequest.onTrade(player, npc, trade, tpz.job.BLM)
end

function onTrigger(player, npc)
    -- JSE quests
    tpz.jsequest.onTrigger(player, npc, tpz.job.BLM)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

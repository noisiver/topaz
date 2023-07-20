-----------------------------------
-- Area: Windurst Waters [S]
--  NPC: Maat
-- !pos
-- MNK job quest NPC
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs")
require("scripts/globals/jsequests")
-----------------------------------

function onTrade(player, npc, trade)
    -- Arch Corse drop 9918
    -- Diremite Dominator drop 9919
    -- Hurricane Fang(Ifrit's) drop 9920
    tpz.jsequest.onTrade(player, npc, trade, tpz.job.MNK)
end

function onTrigger(player, npc)
    -- JSE quests
    tpz.jsequest.onTrigger(player, npc, tpz.job.MNK)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

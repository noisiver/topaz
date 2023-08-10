-----------------------------------
-- Area: Bastok Markets [S]
--  NPC: Werei
-- !pos
-- WAR job quest NPC
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets_[S]/IDs")
require("scripts/globals/jsequests")
-----------------------------------

function onTrade(player, npc, trade)
    -- Scowlenkos drop 9897
    -- Lemures drop 9898
    -- Million Eyes(Psox'ja) drop 9899
    tpz.jsequest.onTrade(player, npc, trade, tpz.job.WAR)
end

function onTrigger(player, npc)
    -- JSE quests
    tpz.jsequest.onTrigger(player, npc, tpz.job.WAR)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

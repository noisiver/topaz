-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Francmage
-- !pos
-- RDM job quest NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria_[S]/IDs")
require("scripts/globals/jsequests")
-----------------------------------

function onTrade(player, npc, trade)
    -- ovinnik drop 9909
    -- catoblepas drop 9910
    -- king buffalo drop 9911
    tpz.jsequest.onTrade(player, npc, trade, tpz.job.RDM)
end

function onTrigger(player, npc)
    -- JSE quests
    tpz.jsequest.onTrigger(player, npc, tpz.job.RDM)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

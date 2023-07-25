-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Rochefogne
-- !pos
-- WHM job quest NPC
-----------------------------------
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
require("scripts/globals/jsequests")
-----------------------------------

function onTrade(player, npc, trade)
    -- Cave Antlion drop 9912
    -- Molech drop 9913
    -- Antares(Gustav Tunnel) drop 9914
    tpz.jsequest.onTrade(player, npc, trade, tpz.job.WHM)
end

function onTrigger(player, npc)
    -- JSE quests
    tpz.jsequest.onTrigger(player, npc, tpz.job.WHM)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

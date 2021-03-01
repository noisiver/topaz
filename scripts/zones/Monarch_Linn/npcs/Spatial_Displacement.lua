-----------------------------------
-- Area: Monarch_Linn
-- NPC:  Spatial Displacement
-- !pos -35 -1 -539 31
-----------------------------------
local ID = require("scripts/zones/Monarch_Linn/IDs")
require("scripts/globals/bcnm")
require("scripts/globals/quests")
require("scripts/globals/missions")
require("scripts/globals/zone")
-----------------------------------

function onTrade(player, npc, trade)
    TradeBCNM(player, npc, trade)
end

function onTrigger(player, npc)
    EventTriggerBCNM(player, npc)
end

function onEventUpdate(player, csid, option, extras)
    EventUpdateBCNM(player, csid, option, extras)
end

function onEventFinish(player, csid, option)
    EventFinishBCNM(player, csid, option)
end

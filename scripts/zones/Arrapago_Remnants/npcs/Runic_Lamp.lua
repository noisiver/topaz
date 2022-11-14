-----------------------------------
-- Area: Arrapago Remnants
-- NPC: Runic Lamp (Arrapago)
-- Used to port player(s) to their saved floor
-- ID: 17080943
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/items")
-----------------------------------
function onTrigger(entity, npc)
    salvageUtil.teleportLamponTrigger(entity)
end

function onTrade(entity, npc, trade)
    salvageUtil.teleportToSavedFloor(entity, npc, trade)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(entity, eventid, result, door)
end
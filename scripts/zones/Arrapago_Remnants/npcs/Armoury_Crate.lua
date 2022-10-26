-----------------------------------
-- Area: Arrapago Remnants
-- NPC: Armoury Crate (Arrapago)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onTrigger(player, npc)
    salvageUtil.ArmouryCrateonTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    salvageUtil.ArmouryCrateonEventFinish(player, csid, option)
end

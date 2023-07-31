-----------------------------------
-- Area: Caedarva Mire
--  Mob: Jazaraat
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    if (player:getCurrentMission(TOAU) == tpz.mission.id.toau.LOST_KINGDOM) then
        player:setCharVar("AhtUrganStatus", 2)
    end
end

-----------------------------------
-- Area: Outer Horutoto Ruins
--   NM: Queen of Coins
-- Involved in mission The Jester Who'd Be King (Windurst 8-2)
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/missions")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getCurrentMission(WINDURST) == tpz.mission.id.windurst.THE_JESTER_WHO_D_BE_KING and player:getCharVar("MissionStatus") == 4 and GetMobByID(mob:getID() - 1):isDead() then
        player:setCharVar("MissionStatus", 5)
    end
end

-----------------------------------
-- Area: Outer Horutoto Ruins
--   NM: Jack of Cups
-- Involved in Full Moon Fountain (Windurst 6-1)
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/missions")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setLocalVar("popTime", os.time())
end

function onMobRoam(mob)
    if os.time() - mob:getLocalVar("popTime") > 180 then
        DespawnMob(mob:getID())
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getCurrentMission(WINDURST) == tpz.mission.id.windurst.FULL_MOON_FOUNTAIN and player:getCharVar("MissionStatus") == 1 then
        player:setCharVar("MissionStatus", 2)
    end
end

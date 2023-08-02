-----------------------------------
-- Area: Balgas Dais
--   NM: Buu Xolo the Bloodfaced
-- Involved in mission Saintly Invitation (Windurst 6-2)
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
end

function onMobRoam(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

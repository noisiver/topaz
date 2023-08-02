-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Bonze Marberry
-- Involved in mission Awakening of the Gods (Windurst 7-2)
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
end

function onMobRoam(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

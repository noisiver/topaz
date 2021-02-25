-----------------------------------
-- Area: Promyvion-Dem
--  MOB: Stray
-----------------------------------
require("scripts/globals/promyvion")
-----------------------------------

function onMobRoam(mob)
    tpz.promyvion.strayOnRoam(mob)
end

function onMobSpawn(mob)
    tpz.promyvion.strayOnSpawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
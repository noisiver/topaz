-----------------------------------
-- Area: Promyvion-Vahzl
--   NM: Stray
-----------------------------------
require("scripts/globals/promyvion")
-----------------------------------
function onMobRoam(mob)
    tpz.promyvion.strayOnRoam(mob)
end

function onMobSpawn(mob)
    tpz.promyvion.strayOnSpawn(mob)
	tpz.promyvion.setEmptyModel(mob)
end

function onMobDeath(mob, player, isKiller)
    tpz.promyvion.onEmptyDeath(mob)
end
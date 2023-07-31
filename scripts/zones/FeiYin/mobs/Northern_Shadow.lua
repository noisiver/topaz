-----------------------------------
-- Area: Fei'Yin
--   NM: Northern Shadow
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

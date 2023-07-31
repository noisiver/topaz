-----------------------------------
-- Area: Jugner_Forest
--   NM: Fradubio
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
end

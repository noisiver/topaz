-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Puroboros
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(3600, 10800)) -- 1 to 3 hours
end

-----------------------------------
-- Area: Gusgen Mines
--  Mob: Foul Meat
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(64800, 43200)) -- 18 to 24 hours
end

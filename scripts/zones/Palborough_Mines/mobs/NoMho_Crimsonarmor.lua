-----------------------------------
-- Area: Palborough Mines
--   NM: No'Mho Crimsonarmor
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(36000, 43200)) -- 21 to 24 hours
end

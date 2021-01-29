-----------------------------------
-- Area: Jugner Forest
--   NM: Meteormauler Zhagtegg
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(75600 + math.random(0, 600)) -- 21 hours, 10 minute window
end

-----------------------------------
-- Area: Jugner Forest
--   NM: Meteormauler Zhagtegg
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(36000 + math.random(0, 600)) -- 21 hours, 10 minute window
end

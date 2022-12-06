-----------------------------------
-- Area: La Vaule [S]
--   NM: Cogtooth Skagnogg
-- Scattershell is very long cast time(3-4s)
-- Perma 3k TP regain
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end

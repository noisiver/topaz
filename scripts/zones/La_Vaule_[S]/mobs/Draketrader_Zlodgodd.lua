-----------------------------------
-- Area: La Vaule [S]
--   NM: Draketrader Zlodgodd
-- Spams jump every 3s
-- Uses two Jumps. ID 733 and ID 1064
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200, 18000)) -- 2 to 5 hours
end

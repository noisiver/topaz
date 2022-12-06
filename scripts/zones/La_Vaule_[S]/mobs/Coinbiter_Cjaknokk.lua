-----------------------------------
-- Area: La Vaule [S]
--   NM: Coinbiter Cjaknokk
-- Immune to Silence Sleep Bind Gravity Paralyze
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end

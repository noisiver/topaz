-----------------------------------
-- Area: La Vaule [S]
--   NM: Falsespinner Bhudbrodd
-- Beserker Dance is undispellable if used by him
-- Doesn't use Fanatics Dance until < 25%? maybe < 50%
-- Always uses Orcish Counterstance then Berserker Dance together
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end

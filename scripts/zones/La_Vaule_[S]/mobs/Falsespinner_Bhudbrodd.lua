-----------------------------------
-- Area: La Vaule [S]
--   NM: Falsespinner Bhudbrodd
-- Beserker Dance is undispellable if used by him
-- Doesn't use Fanatics Dance until < 25%? maybe < 50%
-- Always uses Orcish Counterstance then Berserker Dance together
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end

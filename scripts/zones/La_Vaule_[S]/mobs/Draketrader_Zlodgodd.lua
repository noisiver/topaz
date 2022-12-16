-----------------------------------
-- Area: La Vaule [S]
--   NM: Draketrader Zlodgodd
-- Spams jump every 3s
-- Uses two Jumps. ID 733 and ID 1064
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
    mob:setRespawnTime(math.random(7200, 18000)) -- 2 to 5 hours
end

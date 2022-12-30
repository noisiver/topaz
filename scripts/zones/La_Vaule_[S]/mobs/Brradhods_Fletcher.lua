-----------------------------------
-- Area: La Vaule [S]
--   Braddhods Fletcher
--   BCNM: The Bloodbathed Crown
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
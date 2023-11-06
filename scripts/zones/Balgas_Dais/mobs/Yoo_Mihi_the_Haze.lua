-----------------------------------
-- Area: Balga's Dais
--  Mob: Yoo Mihi the Haze
-- BCNM: Divine Punishers
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

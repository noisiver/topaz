-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Centurio V-III
-- Zilart 6 Fight
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller)
end

-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Nephiyl Pinnacletosser
-- BCNM: Demolition Squad
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

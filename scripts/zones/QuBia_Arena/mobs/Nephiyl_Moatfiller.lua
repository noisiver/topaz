-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Nephiyl Moatfiller
-- BCNM: Demolition Squad
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
     mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

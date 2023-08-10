-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Nephiyl Pinnacletosser
-- BCNM: Demolition Squad
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

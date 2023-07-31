-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Vaicoliaux B D'Aurphe
-- BCNM: Brothers D'Aurphe
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
     mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
     mob:setMod(tpz.mod.REFRESH, 400)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

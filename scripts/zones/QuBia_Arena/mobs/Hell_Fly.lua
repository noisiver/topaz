-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Hell Fly 
-- BCNM: Infernal Swarm
-----------------------------------
-----------------------------------
function onMobSpawn(mob)
     mob:setMod(tpz.mod.REFRESH, 400)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

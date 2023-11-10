-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Hell Fly 
-- BCNM: Infernal Swarm
-----------------------------------
-----------------------------------
function onMobSpawn(mob)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

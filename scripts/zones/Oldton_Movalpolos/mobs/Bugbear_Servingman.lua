------------------------------
-- Area: Oldton Movalpolos
--   Mob: Bugbear Servingman
------------------------------

function onMobRoam(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob, target)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
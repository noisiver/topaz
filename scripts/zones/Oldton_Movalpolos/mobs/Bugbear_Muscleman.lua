------------------------------
-- Area: Oldton Movalpolos
--   NM: Bugbear Muscleman
------------------------------
require("scripts/globals/hunts")
------------------------------
function onMobRoam(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob, target)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 246)
end

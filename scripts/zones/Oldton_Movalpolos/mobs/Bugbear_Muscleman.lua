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

function onMobFight(mob, target)
	mob:setMod(tpz.mod.REGAIN, 250)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 246)
end

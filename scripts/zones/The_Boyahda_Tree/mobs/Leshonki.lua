------------------------------
-- Area: The Boyahda Tree
--   NM: Leshonki
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/world")
------------------------------
function onMobSpawn(mob)
    mob:setDamage(125)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 50)
    mob:setMobMod(tpz.mobMod.GIL_MIN,3500)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 3500) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
end

function onMobRoam(mob)
	if VanadielHour() >= 6 and VanadielHour() <= 18 then
		mob:setMod(tpz.mod.REGEN, 200)
	else
		mob:setMod(tpz.mod.REGEN, 0)
	end
end

function onMobFight(mob, target)
	if VanadielHour() >= 6 and VanadielHour() <= 18 then
		mob:setMod(tpz.mod.REGEN, 200)
	else
		mob:setMod(tpz.mod.REGEN, 0)
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 360)
end

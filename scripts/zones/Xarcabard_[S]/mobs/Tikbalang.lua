------------------------------
-- Area: Xarcabard [S]
--   NM: Tikbalang
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ACC, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 502 then -- Mortal Ray
		local typeEffect = tpz.effect.DREAD_SPIKES
		local drainAmount = mob:getMaxHP() * 0.10
		mob:addStatusEffect(typeEffect, 0, 0, 60, 0, drainAmount, 1)
	end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 540)
end

------------------------------
-- Area: Xarcabard [S]
--   NM: Tikbalang
-- Lyft NM
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/wotg")
------------------------------
function onMobSpawn(mob)
	mob:setDamage(250) -- 350-450 on DD's
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

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT1(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 540)
end

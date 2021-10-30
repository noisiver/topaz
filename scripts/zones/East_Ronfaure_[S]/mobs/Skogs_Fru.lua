------------------------------
-- Area: East Ronfaure [S]
--   NM: Skogs Fru
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
------------------------------
function onMobInitialize(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ACC, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.UDMGMAGIC, -50)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

function onMobFight(mob, target)
	if VanadielHour() >= 6 and VanadielHour() <= 18 then
		mob:setMod(tpz.mod.REGAIN, 250)
	end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 479)
end

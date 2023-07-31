-----------------------------------
-- Area: Mount Zhayolm
--   NM: Energetic Eruca
-- !pos 176.743 -14.210 -180.926 61
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
	mob:setMod(tpz.mod.SLASHRES, 0)
	mob:setMod(tpz.mod.IMPACTRES, 0)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:AnimationSub(0)
end


function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 455)
	if isKiller  then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end

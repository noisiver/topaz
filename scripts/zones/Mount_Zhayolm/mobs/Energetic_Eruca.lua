-----------------------------------
-- Area: Mount Zhayolm
--   NM: Energetic Eruca
-- !pos 176.743 -14.210 -180.926 61
-----------------------------------
require("scripts/globals/hunts")
function onMobSpawn(mob)
	mob:AnimationSub(0)
end


function onMobDeath(mob, player, isKiller)
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

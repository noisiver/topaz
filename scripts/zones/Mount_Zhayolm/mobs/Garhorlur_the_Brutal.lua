-----------------------------------
-- Area: Mount Zhayolm
--   NM: Garhorlur_the_Brutal
-----------------------------------
-----------------------------------

function onMobDeath(mob)
	if isKiller  then 
		isKiller:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		isKiller:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		isKiller:addTreasure(5735, mob)--Cotton Coin Purse
	end
end

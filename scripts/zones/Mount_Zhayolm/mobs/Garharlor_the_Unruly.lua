-----------------------------------
-- Area: Mount Zhayolm
--   NM: Garharlor_the_Unruly
-----------------------------------
-----------------------------------

function onMobDeath(mob)
	if isKiller  then 
		killer:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		killer:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		killer:addTreasure(5735, mob)--Cotton Coin Purse
	end
end

-----------------------------------
-- Area: Mamook
--   NM: Devout Radol Ja
-----------------------------------

function onMobDeath(mob, player, isKiller)
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

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(259200, 432000)) -- 3 to 5 days
end

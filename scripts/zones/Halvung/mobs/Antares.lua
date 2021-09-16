-----------------------------------
-- Area: Halvung
--  Mob: Antares
-----------------------------------
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		isKiller:addTreasure(5735, mob)--Cotton Coin Purse
	end
end

-----------------------------------
-- Area: Caedarva Mire
--  Mob: Reserve_Draugar
-- Note: 
-----------------------------------
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		isKiller:addTreasure(2488, mob)--Alexandrite 
	end
end

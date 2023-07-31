-----------------------------------
-- Area: Arrapago Reef
--  Mob: Fallen_Imperial_Trooper
-----------------------------------
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

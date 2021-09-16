-----------------------------------
-- Area: Mamook
--  Mob: Mamool_Ja_Infiltrator
-----------------------------------
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

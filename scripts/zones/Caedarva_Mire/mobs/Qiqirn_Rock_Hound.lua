-----------------------------------
-- Area: Caedarva Mire
--  Mob: Qiqirn_Rock_Hound
-- Note: 
-----------------------------------
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

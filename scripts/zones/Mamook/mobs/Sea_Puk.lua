-----------------------------------
-- Area: Mamook
--  Mob: Sea_Puk
-----------------------------------
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addCurrency("zeni_point", 10)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

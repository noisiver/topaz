-----------------------------------
-- Area: Halvung
--  Mob: Qiqirn_Mercenary
-----------------------------------
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		killer:addTreasure(2488, mob)--Alexandrite 
	end
end

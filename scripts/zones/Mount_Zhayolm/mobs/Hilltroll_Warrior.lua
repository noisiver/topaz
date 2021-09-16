-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Hilltroll_Warrior
-- Note: 
-----------------------------------
-----------------------------------

function onMobDeath(mob)
	if isKiller and math.random(1,100) <= 24 then 
		killer:addTreasure(2488, mob)--Alexandrite 
	end
end


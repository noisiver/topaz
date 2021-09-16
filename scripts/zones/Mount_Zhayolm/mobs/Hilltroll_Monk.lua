-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Hilltroll_Monk
-- Note: 
-----------------------------------
-----------------------------------

function onMobDeath(mob)
	if isKiller and math.random(1,100) <= 24 then 
		isKiller:addTreasure(2488, mob)--Alexandrite 
	end
end


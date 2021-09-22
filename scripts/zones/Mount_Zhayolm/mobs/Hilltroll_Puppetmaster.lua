-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Hilltroll_Puppetmaster
-- Job: PUP
-----------------------------------
-----------------------------------
function onMobDeath(mob)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end


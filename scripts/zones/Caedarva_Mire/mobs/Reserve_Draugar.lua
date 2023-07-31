-----------------------------------
-- Area: Caedarva Mire
--  Mob: Reserve_Draugar
-- Note: 
-----------------------------------
-----------------------------------
function onMobEngaged(mob, target)
	if mob:getMainJob() == tpz.job.DRG then
		mob:spawnPet()
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

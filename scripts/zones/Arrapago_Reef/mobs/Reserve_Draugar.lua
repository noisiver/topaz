-----------------------------------
-- Area: Arrapago Reef
--  Mob: Reserve_Draugar
-----------------------------------
-----------------------------------
function onMobEngaged(mob, target)
	if mob:getMainJob() == tpz.job.DRG then
		mob:spawnPet()
	end
end

function onMobDeath(mob, player, isKiller)
    player:addCurrency("zeni_point", 10)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

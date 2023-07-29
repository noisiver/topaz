-----------------------------------
-- Area: Halvung
--  Mob: Moblin_Millionaire
-----------------------------------
-----------------------------------
function onMobSpawn(mob)
    mob:setRespawnTime(300)
    mob:setSpawn(-276,19,2)
end

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

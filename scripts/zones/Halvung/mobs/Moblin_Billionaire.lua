-----------------------------------
-- Area: Halvung
--  Mob: Moblin_Billionaire
-----------------------------------
-----------------------------------
function onMobSpawn(mob)
    mob:setRespawnTime(300)
end

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

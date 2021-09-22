-----------------------------------
-- Area: Halvung
--  Mob: Troll_Engraver
-----------------------------------
-----------------------------------
function onMobSpawn(mob)
	mob:spawnPet()
end

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

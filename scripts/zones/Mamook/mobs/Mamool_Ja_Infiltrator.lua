-----------------------------------
-- Area: Mamook
--  Mob: Mamool_Ja_Infiltrator
-----------------------------------
-----------------------------------
function onMobSpawn(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

-----------------------------------
-- Area: Mamook
--  Mob: Colibri
-----------------------------------
mixins = {require("scripts/mixins/families/colibri_mimic")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

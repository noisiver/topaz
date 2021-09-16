-----------------------------------
-- Area: Caedarva Mire
--  Mob: Heraldic Imp
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if mob:AnimationSub() >= 1 then
		player:addTreasure(2157, mob)--Imp Horn
	end
	
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end
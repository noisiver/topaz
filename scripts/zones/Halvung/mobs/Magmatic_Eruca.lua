-----------------------------------
-- Area: Halvung
--  Mob: Magmatic Eruca
-----------------------------------
mixins = {require("scripts/mixins/families/eruca")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		isKiller:addTreasure(2488, mob)--Alexandrite 
	end
end

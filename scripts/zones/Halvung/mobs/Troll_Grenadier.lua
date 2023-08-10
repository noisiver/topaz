-----------------------------------
-- Area: Halvung
--  Mob: Troll_Grenadier
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------



function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

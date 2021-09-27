-----------------------------------
-- Area: Halvung
--  Mob: Troll_Mythril_Guard
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------



function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end


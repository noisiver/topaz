-----------------------------------
-- Area: Caedarva Mire
--  Mob: Lamia Necromancer
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------

function onMobDeath(mob, player, isKiller))
	if isKiller and math.random(1,100) <= 24 then 
		killer:addTreasure(2488, mob)--Alexandrite 
	end
end

-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Troll_Speculator
-- Job: PUP
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------


function onMobDeath(mob)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end


-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Hilltroll_Ranger
-- Note: 
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------
function onMobSpawn(mob)
	mob:AnimationSub(0)
end

function onMobDeath(mob)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end


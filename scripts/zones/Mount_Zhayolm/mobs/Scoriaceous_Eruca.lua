-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Scoriaceous Eruca
-----------------------------------
mixins = {require("scripts/mixins/families/eruca")}
-----------------------------------
function onMobSpawn(mob)
	mob:AnimationSub(0)
end

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
end

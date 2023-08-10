-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Scoriaceous Eruca
-----------------------------------
mixins = {require("scripts/mixins/families/eruca")}
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:AnimationSub(0)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
end

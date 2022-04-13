-----------------------------------
-- Area: Arrapago Reef
--  Mob: Jnun
-----------------------------------
mixins = {require("scripts/mixins/families/karakul")} -- Used for sleeping mixin
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

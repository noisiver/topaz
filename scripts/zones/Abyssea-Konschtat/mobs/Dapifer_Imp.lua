-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Dapifer Imp
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------
function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobDeath(mob, player, isKiller, noKiller)
	if mob:AnimationSub() >= 1 then
		if math.random(1,100) <= 24 then 
			player:addTreasure(2157, mob)--Imp Horn
		end
	end
end

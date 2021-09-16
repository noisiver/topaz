-----------------------------------
-- Area: Caedarva Mire
--  Mob: Orderly Imp
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if mob:AnimationSub >= 1 then
		player:addTreasure(2157, mob)--Imp Horn
	end
end
-----------------------------------
-- Area: Caedarva Mire
--  Mob: Orderly Imp
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
	local broken = mob:getLocalVar("Weapon")
	if broken>= 1 then
		isKiller:addTreasure(2157, mob)--Imp Horn
	end
end
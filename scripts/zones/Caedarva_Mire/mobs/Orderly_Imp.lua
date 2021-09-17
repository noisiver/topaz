-----------------------------------
-- Area: Caedarva Mire
--  Mob: Orderly Imp
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.EVA, -50)
end

function onMobDeath(mob, player, isKiller)
	if mob:AnimationSub() >= 1 then
		player:addTreasure(2157, mob)--Imp Horn
	end
end
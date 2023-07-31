-----------------------------------
-- Area: Riverne - Site B01
--  Mob: Imdugud
-- !pos 655.263 20.664 651.320 29
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	 mob:setMod(tpz.mod.MAIN_DMG_RATING, 25)
     mob:addMod(tpz.mod.DEFP, 25) 
     mob:addMod(tpz.mod.ACC, 25) 
     mob:addMod(tpz.mod.MDEF, 50) 
end

function onMobDeath(mob, player, isKiller, noKiller)
end

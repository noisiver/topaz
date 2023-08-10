-----------------------------------
-- Area: Sacrarium
--  Mob: Elel
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 12)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

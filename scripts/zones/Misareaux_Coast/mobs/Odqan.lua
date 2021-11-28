------------------------------
-- Area: Misareaux Coast
--   NM: Odqan
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 25)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 443)
end

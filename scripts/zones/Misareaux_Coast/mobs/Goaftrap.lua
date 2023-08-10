-----------------------------------
-- Area: Misareaux Coast
--   NM: Goaftrap
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 25)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 444)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(5400, 7200)) -- 90 to 120 min
end

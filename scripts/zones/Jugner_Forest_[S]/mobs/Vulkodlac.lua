------------------------------
-- Area: Jugner Forest [S]
--   NM: Vulkodlac
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
	mob:addMod(tpz.mod.MAIN_DMG_RATING, 25)
    mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.DEFP, 20) 
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 485)
end

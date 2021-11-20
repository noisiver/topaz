------------------------------
-- Area: Jugner Forest [S]
--   NM: Voirloup
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
	mob:setDamage(250)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.MOVE, 12)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 486)
end

------------------------------
-- Area: Sea Serpent Grotto
--   NM: Sea Hog
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 25) 
     mob:addMod(tpz.mod.ATTP, 25)
	 mob:addMod(tpz.mod.ACC, 25)
     mob:addMod(tpz.mod.EVA, 25)
     mob:setMobMod(tpz.mobMod.GIL_MIN, 3600)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 376)
end

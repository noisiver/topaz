-----------------------------------
-- Area: Middle Delkfutt's Tower
--   NM: Scythe Victim
-- Involved In Quest: Blade of Evil
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.DEFP, 50) 
	mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
end



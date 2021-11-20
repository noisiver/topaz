------------------------------
-- Area: Riverne Site-A01
--   NM: Aiatar
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
	mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobDeath(mob, player, isKiller)
end

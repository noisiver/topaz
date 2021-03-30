------------------------------
-- Area: Xarcabard
--   Chaos Elemental
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 60)
end

function onMobInitialize(mob)
    mob:setMod(tpz.mod.UFASTCAST, 50) 
end

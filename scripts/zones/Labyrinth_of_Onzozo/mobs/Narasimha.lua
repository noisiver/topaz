-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Narasimha
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 30) 
    mob:addMod(tpz.mod.ATTP, 20)
    mob:setMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 50)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 15000)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 299)
end

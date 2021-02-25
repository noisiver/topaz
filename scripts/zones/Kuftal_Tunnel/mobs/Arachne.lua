-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Arachne
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6000)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 420)
end

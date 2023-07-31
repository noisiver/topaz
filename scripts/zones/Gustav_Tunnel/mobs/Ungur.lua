-----------------------------------
-- Area: Gustav Tunnel
--   NM: Ungur
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setDamage(100)
    mob:setDelay(2500)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 50) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 10)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 12000)
end


function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 475)
end

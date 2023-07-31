-----------------------------------
-- Area: Gustav Tunnel
--   NM: Taxim
-----------------------------------
require("scripts/globals/hunts")

function onMobSpawn(mob)
    mob:setDamage(110)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 50) 
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:addMod(tpz.mod.SLEEPRESTRAIT, 100)
    mob:addMod(tpz.mod.LULLABYRESTRAIT, 100)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 3000)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 424)
end

-----------------------------------
-- Area: Gustav Tunnel
--   NM: Wyvernpoacher Drachlox
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:addMod(tpz.mod.STUNRESTRAIT, 100)
    mob:addMod(tpz.mod.LULLABYRESTRAIT, 100)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6000)
end

function onMobDeath(mob, player, isKiller)
end

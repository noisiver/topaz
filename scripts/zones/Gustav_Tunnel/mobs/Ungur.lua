-----------------------------------
-- Area: Gustav Tunnel
--   NM: Ungur
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.ACC, 50)
    mob:addMod(tpz.mod.EVA, 50)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 10)
    mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 2500)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 12000)
end


function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 475)
end

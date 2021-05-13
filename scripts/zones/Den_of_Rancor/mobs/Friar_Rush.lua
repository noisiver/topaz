------------------------------
-- Area: Den of Rancor
--   NM: Friar Rush
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 200)
    mob:addMod(tpz.mod.DEFP, -100)
    mob:setMod(tpz.mod.UDMGMAGIC, 50)
    mob:addMod(tpz.mod.ACC, -100) 
    mob:addMod(tpz.mod.EVA, -100)
    mob:addMod(tpz.mod.MATT, 50)
    mob:addMod(tpz.mod.MEVA, -100)
    mob:setMod(tpz.mod.UFASTCAST, 75)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 75)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 394)
end

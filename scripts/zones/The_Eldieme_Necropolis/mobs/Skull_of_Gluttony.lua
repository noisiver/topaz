------------------------------
-- Area: The Eldieme Necropolis
--   NM: Skull of Gluttony
------------------------------
require("scripts/globals/hunts")
------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 50)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.REFRESH, 400)
end

function onMobDeath(mob, player, isKiller)
    GetNPCByID(ID.npc.SKULL_OF_GLUTTONY):updateNPCHideTime(3600) -- 1 Hr
    tpz.hunts.checkHunt(mob, player, 184)
end

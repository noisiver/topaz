-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Marchelute
-- Involved In Quest: Messenger from Beyond
-- !pos -716 -10 66 103
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
end

function onMobDeath(mob, player, isKiller)
end

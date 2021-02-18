-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Leech King
-----------------------------------
local ID = require("scripts/zones/Maze_of_Shakhrami/IDs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    if math.random(2) == 1 then
        DisallowRespawn(ID.mob.LEECH_KING, true)
        DisallowRespawn(ID.mob.ARGUS, false)
        UpdateNMSpawnPoint(ID.mob.ARGUS)
        GetMobByID(ID.mob.ARGUS):setRespawnTime(math.random(64800, 108000)) -- 18-30 hours
    else
        DisallowRespawn(ID.mob.ARGUS, true)
        DisallowRespawn(ID.mob.LEECH_KING, false)
        UpdateNMSpawnPoint(ID.mob.LEECH_KING)
        GetMobByID(ID.mob.LEECH_KING):setRespawnTime(math.random(64800, 108000)) -- 18-30 hours
    end
end

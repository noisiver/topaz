-----------------------------------
-- Area: Eastern Altepa Desert (114)
--   NM: Centurio XII-I
------------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    -- Set Centurio XII-I's spawnpoint
    UpdateNMSpawnPoint(mob:getID())
end

-----------------------------------
-- Area: Rolanberry Fields (110)
--  HNM: Simurgh
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 50) 
     mob:addMod(tpz.mod.ATTP, 50)
     mob:addMod(tpz.mod.ACC, 100) 
     mob:addMod(tpz.mod.EVA, 50)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SIMURGH_POACHER)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(3600, 7200)) -- 1 to 2 hours
end

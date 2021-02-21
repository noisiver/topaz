-----------------------------------
-- Area: Garlaige Citadel (200)
--   NM: Serket
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 100)
    mob:setMod(tpz.mod.ACC, 400) 
    mob:addMod(tpz.mod.EVA, 100)
    mob:setMod(tpz.mod.MACC, 1000) 
    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SERKET_BREAKER)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end

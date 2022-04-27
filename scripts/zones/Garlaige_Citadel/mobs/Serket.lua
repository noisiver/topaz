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
	mob:setDamage(130)
    mob:setMod(tpz.mod.ATT, 500)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:setMod(tpz.mod.ACC, 400) 
    mob:addMod(tpz.mod.EVA, 140)
    mob:setMod(tpz.mod.MACC, 1000) 
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SERKET_BREAKER)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(36000, 43200)) -- 11 to 12 hours
end

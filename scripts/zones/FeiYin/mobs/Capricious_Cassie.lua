-----------------------------------
-- Area: Fei'Yin
--   NM: Capricious Cassie
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
	mob:setDamage(130)
    mob:setMod(tpz.mod.ATT, 500)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:setMod(tpz.mod.ACC, 400) 
    mob:addMod(tpz.mod.EVA, 140)
    mob:setMod(tpz.mod.MACC, 1000) 
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
    mob:setLocalVar("[rage]timer", 1800) -- 30 minutes
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.CASSIENOVA)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(36000, 43200)) -- 21-24 hours
end

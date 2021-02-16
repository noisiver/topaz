-----------------------------------
-- Area: Meriphataud Mountains (119)
--   NM: Waraxe Beak
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 25) 
     mob:addMod(tpz.mod.ATTP, 25)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end

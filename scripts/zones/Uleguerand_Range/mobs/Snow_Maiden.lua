-----------------------------------
-- Area: Uleguerand Range
--  Mob:Snow Maiden
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
local ID = require("scripts/zones/Uleguerand_range/IDs")
------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.REGEN, 50)
end


function onMobDespawn(mob)
    if math.random(2) == 1 then
        DisallowRespawn(ID.mob.FATHER_FROST, true)
        DisallowRespawn(ID.mob.SNOW_MAIDEN, false)
        UpdateNMSpawnPoint(ID.mob.SNOW_MAIDEN)
        GetMobByID(ID.mob.SNOW_MAIDEN):setRespawnTime(900) 
    else
        DisallowRespawn(ID.mob.SNOW_MAIDEN, true)
        DisallowRespawn(ID.mob.FATHER_FROST, false)
        UpdateNMSpawnPoint(ID.mob.FATHER_FROST)
        GetMobByID(ID.mob.FATHER_FROST):setRespawnTime(900) 
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
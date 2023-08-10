-----------------------------------
-- Area: Ordelles Caves (193)
--   NM: Morbolger
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ALWAYS_AGGRO, 1) -- "Aggros regardless of level"
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.MORBOLBANE)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(36000, 43200)) -- 21 to 24 hours
end

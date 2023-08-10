------------------------------
-- Area: Misareaux Coast
--   NM: Odqan
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
local ID = require("scripts/zones/Misareaux_Coast/IDs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
end

function onMobRoam(mob)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 443)
end
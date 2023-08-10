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
end

function onMobRoam(mob)
    local vHour = VanadielHour()
    if vHour > 8 then -- Despawn after 8 AM
        DespawnMob(mob:getID())
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
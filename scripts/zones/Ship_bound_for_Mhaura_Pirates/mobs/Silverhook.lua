-----------------------------------
-- Area: Ship bound for Mhaura (Pirates)
--  Mob: Silverhook
-----------------------------------
local ID = require("scripts/zones/Ship_bound_for_Mhaura_Pirates/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
end

function onMobDeath(mob, player)
    mob:setLocalVar("respawnTime", os.time() + 3600)
end

function onMobDespawn(mob, player)
    GetMobByID(ID.mob.SHIP_WIGHT):setLocalVar("respawnTime", os.time() + 60)
end
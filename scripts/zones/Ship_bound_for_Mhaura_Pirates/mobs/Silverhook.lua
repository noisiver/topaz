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

end

function onMobDespawn(mob, player)
    GetMobByID(ID.mob.SHIP_WIGHT):setLocalVar("respawnTime", os.time() + 60)
    mob:setLocalVar("killed", 1)
end
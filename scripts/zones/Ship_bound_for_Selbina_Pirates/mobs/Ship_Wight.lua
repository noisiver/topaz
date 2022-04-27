-----------------------------------
-- Area: Ship Bound for Selbina Pirates
--  Mob: Ship Wight
-- Note: Place holder for Blackbeard
-----------------------------------
local ID = require("scripts/zones/Ship_bound_for_Selbina_Pirates/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.BLACKBEARD_PH, 20, 3600) -- 1 hour
end

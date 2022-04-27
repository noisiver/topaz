-----------------------------------
-- Area: Ship Bound for Mhaura Pirates
--  Mob: Ship Wight
-- Note: Place holder for Silverhook
-----------------------------------
local ID = require("scripts/zones/Ship_bound_for_Mhaura_Pirates/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SILVERHOOK_PH, 20, 3600) -- 1 hour
end

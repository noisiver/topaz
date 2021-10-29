-----------------------------------
-- Area: Meriphataud Mountains [S]
--  Mob: Mountain Scolopendrid
-- Note: PH for Centipedal Centruroides
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.CENTIPEDAL_CENTRUROIDES_PH, 20, 3600) -- 1 hour
end

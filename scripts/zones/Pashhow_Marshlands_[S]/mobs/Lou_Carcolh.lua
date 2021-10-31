-----------------------------------
-- Area: Pashhow Marshlands [S]
--  Mob: Lou Carcolh
-- Note: PH for Nommo
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.NOMMO_PH, 20, 3600) -- 1 hour
end

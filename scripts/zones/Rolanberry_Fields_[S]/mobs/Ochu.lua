-----------------------------------
-- Area: Rolanberry Fields [S]
--  Mob: Ochu
-- Note: PH for Delicieuse Delphine
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.DELICIEUSE_DELPHINE_PH, 20, 3600) -- 1 hour
end

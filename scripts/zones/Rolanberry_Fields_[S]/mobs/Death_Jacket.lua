-----------------------------------
-- Area: Rolanberry Fields [S]
--  Mob: Death Jacket
-- Note: PH for Erle 
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.ERLE_PH, 20, 7200) -- 2 hours
end

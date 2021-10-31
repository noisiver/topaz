-----------------------------------
-- Area: Rolanberry Fields [S]
--  Mob: Scabrous Slug
-- Note: PH for Dyinyinga 
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.DYINYINGA_PH, 20, 3600) -- 1 hour
end

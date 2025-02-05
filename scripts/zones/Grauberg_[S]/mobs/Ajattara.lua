-----------------------------------
-- Area: Grauberg [S]
--  Mob: Ajattara
-- Note: PH for Scitalis
-----------------------------------
local ID = require("scripts/zones/Grauberg_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SCITALIS_PH, 5, 3600) -- 1 hour
end

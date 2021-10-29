-----------------------------------
-- Area: Grauberg [S]
--  Mob: Wivre
-- Note: PH for Vasiliceratops
-----------------------------------
local ID = require("scripts/zones/Grauberg_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.VASILICERATOPS_PH, 20, 7200) -- 2 hours
end

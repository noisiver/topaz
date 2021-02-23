-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  Mob: Mousse
-- Note: PH for Sewer Syrup
-----------------------------------
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SEWER_SYRUP_PH, 30, 3600) -- 1 hr
end

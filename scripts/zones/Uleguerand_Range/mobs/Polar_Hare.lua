-----------------------------------
-- Area: Uleguerand Range
--  Mob: Polar Hare
-- Note: PH for Skvader
-----------------------------------
local ID = require("scripts/zones/Uleguerand_Range/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SKVADER_PH, 20, 3600) -- 1 hour
end

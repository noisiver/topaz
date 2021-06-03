-----------------------------------
-- Area: Uleguerand Range
--  Mob: Buffalo
-- Note: PH for Bonnacon
-----------------------------------
local ID = require("scripts/zones/Uleguerand_Range/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.BONNACON_PH, 10, math.random(3600, 43200)) -- 1 to 24 hours
end

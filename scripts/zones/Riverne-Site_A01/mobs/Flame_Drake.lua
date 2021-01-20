-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Flame Drake
-- Note: PH for Aiatar
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.Aiatar_PH, 20, 3600) -- 1 hour
end

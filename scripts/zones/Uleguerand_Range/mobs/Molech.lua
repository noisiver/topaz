-----------------------------------
-- Area: Uleguerand Range
--  Mob: Molech
-- Note: PH for Magnotaur
-----------------------------------
local ID = require("scripts/zones/Uleguerand_Range/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.MAGNOTAUR_PH, 20, 3600) -- 1 hour
end

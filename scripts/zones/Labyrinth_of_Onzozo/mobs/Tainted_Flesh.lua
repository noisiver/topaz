-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Tainted Flesh
-- Note: Place holder for Hellion
-----------------------------------
local ID = require("scripts/zones/Labyrinth_of_Onzozo/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.HELLION_PH, 50, 7200) -- 2 hours
end

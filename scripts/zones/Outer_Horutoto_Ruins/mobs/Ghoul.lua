-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Ghoul
-- Note: Place holder for Ah Puch
-----------------------------------
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.AH_PUCH_PH, 25, math.random(3600, 10800)) -- 1 to 3 hours
end

-----------------------------------
-- Area: Meriphataud Mountains [S]
--  Mob: Gnat
-- Note: PH for Hemodrosophila
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.HEMODROSOPHILA_PH, 20, 540) -- 90m
end

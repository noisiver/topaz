-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Stink Bats
-- Note: PH for Desmodont
-----------------------------------
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.DESMODONT_PH, 30, 3600) -- 1 hour
end

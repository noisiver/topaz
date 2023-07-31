-----------------------------------
-- Area: Jugner Forest [S]
--  Mob: Decrepit Gnole
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.VOIRLOUP_PH, 20, 3600) -- 1 hour
end


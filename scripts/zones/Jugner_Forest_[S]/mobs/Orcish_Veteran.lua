-----------------------------------
-- Area: Jugner Forest [S]
--  Mob: Orcish Veteran
-- Note: PH for Drumskull Zogdregg
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.DRUMSKULL_ZOGDREGG_PH, 20, 3600) -- 1 hour
end

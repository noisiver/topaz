-----------------------------------
-- Area: Xarcabard [S]
--  Mob: Dire Gargouille
-- Note: PH for Graoully
-----------------------------------
local ID = require("scripts/zones/Xarcabard_[S]/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/gargouille")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.GRAOULLY_PH, 20, 3600) -- 1 hour
end

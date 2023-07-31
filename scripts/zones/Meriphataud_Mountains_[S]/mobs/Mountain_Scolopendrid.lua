-----------------------------------
-- Area: Meriphataud Mountains [S]
--  Mob: Mountain Scolopendrid
-- Note: PH for Centipedal Centruroides
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains_[S]/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/scorpion_gold")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.CENTIPEDAL_CENTRUROIDES_PH, 20, 7200) -- 2 hours
end

-----------------------------------
-- Area: Castle Oztroja (151)
--  Mob: Yagudo Zealot
-- Note: PH for Yaa Haqa the Profane
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.YAA_HAQA_THE_PROFANE_PH, 30, 3600) -- 1 hours
end

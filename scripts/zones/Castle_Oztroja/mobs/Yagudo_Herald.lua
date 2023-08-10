-----------------------------------
-- Area: Castle Oztroja (151)
--  Mob: Yagudo Herald
-- Note: PH for Quu Domi the Gallant
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.QUU_DOMI_THE_GALLANT_PH, 30, 3600) -- 1 hour
end

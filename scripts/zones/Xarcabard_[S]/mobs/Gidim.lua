-----------------------------------
-- Area: Xarcabard [S]
--  Mob: Gidim
-- Note: PH for Prince Orobas
-----------------------------------
local ID = require("scripts/zones/Xarcabard_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.PRINCE_OROBAS_PH, 20, 14400) -- 4 hours
end

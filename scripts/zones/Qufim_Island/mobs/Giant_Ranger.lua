-----------------------------------
-- Area: Qufim Island
--  Mob: Giant Ranger
-- Note: PH for Slippery Sucker
-----------------------------------
local ID = require("scripts/zones/Qufim_Island/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 44, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 45, 2, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SLIPPERY_SUCKER_PH, 20, 600) -- 10 minutes
end

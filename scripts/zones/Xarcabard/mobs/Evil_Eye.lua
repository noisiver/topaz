-----------------------------------
-- Area: Xarcabard
--  Mob: Evil Eye
-- Note: PH for Shadow Eye
-----------------------------------
local ID = require("scripts/zones/Xarcabard/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 53, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 54, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 55, 3, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SHADOW_EYE_PH, 20, 3600) -- 1 hour
end

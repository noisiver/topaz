-----------------------------------
-- Area: Xarcabard
--  Mob: Demon Warlock
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 55, 1, tpz.regime.type.FIELDS)
end

-----------------------------------
-- Area: North Gustaberg
--  Mob: Amber Quadav
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 19, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 59, 1, tpz.regime.type.FIELDS)
end

-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Wildkeeper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 787, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 789, 1, tpz.regime.type.GROUNDS)
end

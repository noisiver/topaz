-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Ancient Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 777, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 778, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 779, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 780, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 781, 1, tpz.regime.type.GROUNDS)
end

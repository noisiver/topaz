-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Gigas Torturer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 785, 1, tpz.regime.type.GROUNDS)
end

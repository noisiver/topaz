-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Hill Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 7, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 8, 2, tpz.regime.type.FIELDS)
end

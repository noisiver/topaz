-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Thread Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 57, 1, tpz.regime.type.FIELDS)
end

-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Goblin Leecher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 57, 2, tpz.regime.type.FIELDS)
end

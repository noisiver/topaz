-----------------------------------
-- Area: Quicksand Caves
--  Mob: Sand Digger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 814, 1, tpz.regime.type.GROUNDS)
end

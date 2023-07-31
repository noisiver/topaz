-----------------------------------
-- Area: Quicksand Caves
--  Mob: Girtab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 818, 1, tpz.regime.type.GROUNDS)
end

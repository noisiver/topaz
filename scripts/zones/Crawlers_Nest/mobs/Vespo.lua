-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Vespo
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 693, 2, tpz.regime.type.GROUNDS)
end

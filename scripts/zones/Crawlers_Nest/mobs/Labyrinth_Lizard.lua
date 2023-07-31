-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Labyrinth Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 689, 1, tpz.regime.type.GROUNDS)
end

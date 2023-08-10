-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Labyrinth Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 763, 1, tpz.regime.type.GROUNDS)
end

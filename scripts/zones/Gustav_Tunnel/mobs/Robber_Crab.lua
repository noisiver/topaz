-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Robber Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 765, 1, tpz.regime.type.GROUNDS)
end

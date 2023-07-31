-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Hawker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 764, 1, tpz.regime.type.GROUNDS)
end

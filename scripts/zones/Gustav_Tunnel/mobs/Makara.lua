-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Makara
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 764, 2, tpz.regime.type.GROUNDS)
end

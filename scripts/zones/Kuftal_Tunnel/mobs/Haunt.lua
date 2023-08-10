-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Haunt
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 736, 2, tpz.regime.type.GROUNDS)
end

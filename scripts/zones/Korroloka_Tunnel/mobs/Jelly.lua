-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Jelly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 729, 2, tpz.regime.type.GROUNDS)
end

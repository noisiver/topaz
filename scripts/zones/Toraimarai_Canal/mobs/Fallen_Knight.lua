-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Fallen Knight
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 619, 1, tpz.regime.type.GROUNDS)
end

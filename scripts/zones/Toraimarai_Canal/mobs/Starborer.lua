-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Starborer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 622, 1, tpz.regime.type.GROUNDS)
end

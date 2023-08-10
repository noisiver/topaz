-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Droma
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 707, 1, tpz.regime.type.GROUNDS)
end

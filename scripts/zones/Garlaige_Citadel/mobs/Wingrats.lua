-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Wingrats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 703, 1, tpz.regime.type.GROUNDS)
end

-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Fallen Officer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 703, 2, tpz.regime.type.GROUNDS)
end

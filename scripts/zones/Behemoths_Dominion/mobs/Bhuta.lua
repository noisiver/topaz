-----------------------------------
-- Area: Behemoths Dominion
--  Mob: Bhuta
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 103, 2, tpz.regime.type.FIELDS)
end

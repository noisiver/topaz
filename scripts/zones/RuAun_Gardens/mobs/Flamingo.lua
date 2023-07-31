-----------------------------------
-- Area: RuAun Gardens
--  Mob: Flamingo
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 142, 1, tpz.regime.type.FIELDS)
end

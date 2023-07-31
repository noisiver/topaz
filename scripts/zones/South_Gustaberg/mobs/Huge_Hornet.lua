-----------------------------------
-- Area: South Gustaberg
--  Mob: Huge Hornet
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 76, 1, tpz.regime.type.FIELDS)
end

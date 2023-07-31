-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Bakru
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 26, 1, tpz.regime.type.FIELDS)
end

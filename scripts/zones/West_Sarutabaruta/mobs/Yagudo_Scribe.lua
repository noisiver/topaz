-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Yagudo Scribe
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 29, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 61, 1, tpz.regime.type.FIELDS)
end

-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Antican Essedarius
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 134, 2, tpz.regime.type.FIELDS)
end

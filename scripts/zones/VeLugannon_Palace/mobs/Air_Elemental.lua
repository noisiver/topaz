-----------------------------------
-- Area: Ve'Lugannon Palace
--  Mob: Air Elemental
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 748, 1, tpz.regime.type.GROUNDS)
end

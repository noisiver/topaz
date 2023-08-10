-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Wadi Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 641, 2, tpz.regime.type.GROUNDS)
end

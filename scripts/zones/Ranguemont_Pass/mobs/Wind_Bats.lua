-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Wind Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 602, 1, tpz.regime.type.GROUNDS)
end

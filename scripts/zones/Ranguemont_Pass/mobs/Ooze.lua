-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Ooze
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 603, 2, tpz.regime.type.GROUNDS)
end

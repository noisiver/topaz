-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Wespe
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 790, 2, tpz.regime.type.GROUNDS)
end

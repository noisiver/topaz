-----------------------------------
-- Area: Fei'Yin
--  Mob: Balayang
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 717, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 718, 1, tpz.regime.type.GROUNDS)
end

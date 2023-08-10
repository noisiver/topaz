-----------------------------------
-- Area: Fei'Yin
--  Mob: Shadow
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 712, 1, tpz.regime.type.GROUNDS)
end

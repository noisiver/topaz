-----------------------------------
-- Area: Fei'Yin
--  Mob: Vampire Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 711, 1, tpz.regime.type.GROUNDS)
end

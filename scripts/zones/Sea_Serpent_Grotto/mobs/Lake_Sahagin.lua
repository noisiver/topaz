-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Lake Sahagin
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 806, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 807, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 808, 1, tpz.regime.type.GROUNDS)
end

-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Old Opo-opo
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 756, 1, tpz.regime.type.GROUNDS)
end

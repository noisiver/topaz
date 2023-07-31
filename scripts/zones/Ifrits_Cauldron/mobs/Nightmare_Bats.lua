-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Nightmare Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 760, 1, tpz.regime.type.GROUNDS)
end

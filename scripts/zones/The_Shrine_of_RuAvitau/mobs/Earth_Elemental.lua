-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Earth Elemental
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 750, 1, tpz.regime.type.GROUNDS)
end

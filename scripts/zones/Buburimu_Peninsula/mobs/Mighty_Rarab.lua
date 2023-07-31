-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Mighty Rarab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 32, 2, tpz.regime.type.FIELDS)
end

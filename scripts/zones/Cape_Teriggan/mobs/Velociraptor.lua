-----------------------------------
-- Area: Cape Teriggan
--  Mob: Velociraptor
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 106, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 107, 1, tpz.regime.type.FIELDS)
end

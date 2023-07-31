-----------------------------------
-- Area: The Sanctuary of ZiTah
--  Mob: Ogrefly
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 114, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 115, 2, tpz.regime.type.FIELDS)
end

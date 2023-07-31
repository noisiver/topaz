-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Sauromugue Skink
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 97, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 99, 1, tpz.regime.type.FIELDS)
end

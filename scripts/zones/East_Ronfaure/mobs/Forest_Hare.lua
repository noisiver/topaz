-----------------------------------
-- Area: East Ronfaure
--  Mob: Forest Hare
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 66, 1, tpz.regime.type.FIELDS)
end

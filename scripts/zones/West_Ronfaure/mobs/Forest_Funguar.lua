-----------------------------------
-- Area: West Ronfaure
--  Mob: Forest Funguar
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 3, 2, tpz.regime.type.FIELDS)
end

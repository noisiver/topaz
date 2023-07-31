-----------------------------------
-- Area: East Ronfaure
--  Mob: Orcish Mesmerizer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 67, 1, tpz.regime.type.FIELDS)
end

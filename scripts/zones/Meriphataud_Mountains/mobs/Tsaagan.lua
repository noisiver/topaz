-----------------------------------
-- Area: Meriphataud Mountains
--   NM: Tsaagan
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 39, 1, tpz.regime.type.FIELDS)
end

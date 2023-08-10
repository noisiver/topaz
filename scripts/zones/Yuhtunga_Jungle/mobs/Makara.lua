-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Makara
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 127, 2, tpz.regime.type.FIELDS)
end

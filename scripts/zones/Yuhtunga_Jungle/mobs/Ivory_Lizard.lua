-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Ivory Lizard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 124, 2, tpz.regime.type.FIELDS)
end

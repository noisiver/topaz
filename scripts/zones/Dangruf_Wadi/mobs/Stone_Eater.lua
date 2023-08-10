-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Stone Eater
-----------------------------------
require("scripts/globals/regimes")
mixins = {require("scripts/mixins/families/worm")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 639, 1, tpz.regime.type.GROUNDS)
end

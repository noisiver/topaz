-----------------------------------
-- Area: Den of Rancor
--  Mob: Cave Worm
-----------------------------------
require("scripts/globals/regimes")
mixins = {require("scripts/mixins/families/worm")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 796, 2, tpz.regime.type.GROUNDS)
end

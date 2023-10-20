-----------------------------------
-- Area: Gusgen Mines
--  Mob: Ore Eater
-----------------------------------
require("scripts/globals/regimes")
mixins = {require("scripts/mixins/families/worm")}
-----------------------------------
function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 681, 1, tpz.regime.type.GROUNDS)
end

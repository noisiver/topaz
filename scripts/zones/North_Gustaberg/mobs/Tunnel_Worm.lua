-----------------------------------
-- Area: North Gustaberg
--  Mob: Tunnel Worm
-----------------------------------
require("scripts/globals/regimes")
mixins = {require("scripts/mixins/families/worm")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 16, 1, tpz.regime.type.FIELDS)
end

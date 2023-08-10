-----------------------------------
-- Area: Jugner Forest
--  Mob: Screamer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 58, 2, tpz.regime.type.FIELDS)
end

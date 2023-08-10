-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Goblin Tinkerer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 62, 2, tpz.regime.type.FIELDS)
end

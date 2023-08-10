-----------------------------------
-- Area: Cape Teriggan
--  Mob: Goblin Alchemist
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 105, 2, tpz.regime.type.FIELDS)
end

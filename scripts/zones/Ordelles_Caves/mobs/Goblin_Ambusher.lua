-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Goblin Ambusher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 657, 1, tpz.regime.type.GROUNDS)
end

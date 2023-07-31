-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Goblin Tinkerer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 695, 1, tpz.regime.type.GROUNDS)
end

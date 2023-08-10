-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Abyss Worm
-----------------------------------
require("scripts/globals/regimes")
mixins = {require("scripts/mixins/families/worm")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 699, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 700, 1, tpz.regime.type.GROUNDS)
end

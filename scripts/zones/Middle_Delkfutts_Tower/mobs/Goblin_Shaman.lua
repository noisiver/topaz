-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Goblin Shaman
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 782, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 784, 1, tpz.regime.type.GROUNDS)
end

-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Stalking Sapling
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 655, 1, tpz.regime.type.GROUNDS)
end

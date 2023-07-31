-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Mourioche
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 720, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 721, 1, tpz.regime.type.GROUNDS)
end

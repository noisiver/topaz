-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Skimmer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 723, 1, tpz.regime.type.GROUNDS)
end

-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Funnel Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 611, 1, tpz.regime.type.GROUNDS)
end

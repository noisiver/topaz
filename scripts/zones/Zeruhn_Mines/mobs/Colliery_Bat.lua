-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Colliery Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 626, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 626, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 626, 1, tpz.regime.type.GROUNDS)
end

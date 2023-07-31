-----------------------------------
-- Area: Gusgen Mines
--  Mob: Gallinipper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 684, 2, tpz.regime.type.GROUNDS)
end

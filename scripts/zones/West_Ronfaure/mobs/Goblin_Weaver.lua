-----------------------------------
-- Area: West Ronfaure
--  Mob: Goblin Weaver
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 56, 2, tpz.regime.type.FIELDS)
end

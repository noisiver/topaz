-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Borer Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 704, 2, tpz.regime.type.GROUNDS)
end

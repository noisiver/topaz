-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Gigas Stonemason
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 733, 1, tpz.regime.type.GROUNDS)
end

-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Viseclaw
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 726, 1, tpz.regime.type.GROUNDS)
end

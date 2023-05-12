-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Greater Pugil
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 731, 2, tpz.regime.type.GROUNDS)
end

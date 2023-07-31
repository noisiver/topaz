-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Blighting Brand
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 275)
    tpz.regime.checkRegime(player, mob, 100, 2, tpz.regime.type.FIELDS)
end

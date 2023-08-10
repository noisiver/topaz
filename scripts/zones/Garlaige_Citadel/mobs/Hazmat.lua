------------------------------
-- Area: Garlaige Citadel
--   NM: Hazmat
------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/hunts")
------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 300)
end

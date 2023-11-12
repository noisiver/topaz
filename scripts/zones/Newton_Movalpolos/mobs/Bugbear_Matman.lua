 q------------------------------
-- Area: Newton Movalpolos
--   NM: Bugbear Matman
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.STORETP, 100)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 5000)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 248)
end

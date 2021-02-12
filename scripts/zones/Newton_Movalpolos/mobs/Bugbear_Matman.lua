------------------------------
-- Area: Newton Movalpolos
--   NM: Bugbear Matman
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ROAM_DISTANCE, 0)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 248)
end

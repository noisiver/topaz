------------------------------
-- Area: Castle Oztroja
--   NM: Yagudo Parasite
------------------------------
require("scripts/globals/hunts")
------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ROAM_DISTANCE, 5)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 244)
end

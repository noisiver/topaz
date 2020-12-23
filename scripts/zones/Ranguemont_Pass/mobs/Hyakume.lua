------------------------------
-- Area: Ranguemont Pass
--   NM: Hyakume
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 344)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.HYAKUME_PH, 30, 3600) -- 1 hour
end

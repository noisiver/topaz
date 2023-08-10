------------------------------
-- Area: Quicksand Caves
--   NM: Nussknacker
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 435)
end

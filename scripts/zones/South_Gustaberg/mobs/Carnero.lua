------------------------------
-- Area: South Gustaberg
--   NM: Carnero
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 202)
end

------------------------------
-- Area: Qufim Island
--   NM: Trickster Kinetix
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 307)
end

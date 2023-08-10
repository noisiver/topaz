------------------------------
-- Area: The Sanctuary of ZiTah
--   NM: Keeper of Halidom
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 324)
end

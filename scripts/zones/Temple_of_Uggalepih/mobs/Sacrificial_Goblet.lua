------------------------------
-- Area: Temple of Uggalepih
--   NM: Sacrificial Goblet
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 391)
end

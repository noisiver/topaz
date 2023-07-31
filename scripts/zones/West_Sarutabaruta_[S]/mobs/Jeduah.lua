------------------------------
-- Area: West Sarutabaruta [S]
--   NM: Jeduah
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 517)
end

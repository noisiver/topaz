------------------------------
-- Area: Korroloka Tunnel
--   NM: Thoon
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 229)
end

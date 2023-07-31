------------------------------
-- Area: Korroloka Tunnel
--   NM: Falcatus Aranei
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 227)
end

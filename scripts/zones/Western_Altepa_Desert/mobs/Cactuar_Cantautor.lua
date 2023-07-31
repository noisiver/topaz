------------------------------
-- Area: Western Altepa Desert
--   NM: Cactuar Cantautor
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 412)
end

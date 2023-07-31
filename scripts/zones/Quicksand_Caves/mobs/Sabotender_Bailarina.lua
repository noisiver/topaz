------------------------------
-- Area: Quicksand Caves
--   NM: Sabotender Bailarina
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 433)
end

------------------------------
-- Area: The Eldieme Necropolis
--   NM: Skull of Lust
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 187)
end

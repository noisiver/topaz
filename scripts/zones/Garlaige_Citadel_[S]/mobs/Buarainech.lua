------------------------------
-- Area: Garlaige Citadel [S]
--   NM: Buarainech
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 534)
end

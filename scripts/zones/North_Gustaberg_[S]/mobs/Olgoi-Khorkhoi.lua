------------------------------
-- Area: North Gustaberg [S]
--   NM: Olgoi-Khorkhoi
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 499)
end

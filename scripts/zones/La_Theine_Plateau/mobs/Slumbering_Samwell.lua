------------------------------
-- Area: La Theine Plateau
--   NM: Slumbering Samwell
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 155)
end

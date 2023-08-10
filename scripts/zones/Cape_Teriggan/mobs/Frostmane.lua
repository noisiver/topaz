-----------------------------------
-- Area: Cape Teriggan
--   NM: Frostmane
-----------------------------------
require("scripts/globals/hunts")

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 405)
end

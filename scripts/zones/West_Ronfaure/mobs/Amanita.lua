------------------------------
-- Area: West Ronfaure
--   NM: Amanita
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 60) -- changed from 149
end

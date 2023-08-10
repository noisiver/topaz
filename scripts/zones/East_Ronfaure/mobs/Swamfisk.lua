-----------------------------------
-- Area: East Ronfaure
--   NM: Swamfisk
-----------------------------------
require("scripts/globals/hunts")

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 150)
end

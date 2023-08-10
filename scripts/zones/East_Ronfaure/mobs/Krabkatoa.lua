-----------------------------------
-- Area: East Ronfaure
--  VNM: Krabkatoa
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.KRABKATOA_STEAMER)
end

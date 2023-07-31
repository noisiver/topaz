-----------------------------------
-- Area: North Gustaberg [S]
--  VNM: Yilbegan
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.YILBEGAN_HIDEFLAYER)
end

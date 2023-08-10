-----------------------------------
-- Area: Rolanberry Fields [S]
--  VNM: Verthandi
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.VERTHANDI_ENSNARER)
end

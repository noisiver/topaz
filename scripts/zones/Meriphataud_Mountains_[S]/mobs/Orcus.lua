-----------------------------------
-- Area: Meriphataud Mountains [S]
--  VNM: Orcus
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.ORCUS_TROPHY_HUNTER)
end

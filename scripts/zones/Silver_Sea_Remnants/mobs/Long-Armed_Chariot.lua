-----------------------------------
-- Area: Silver Sea Remnants
--   NM: Long-Armed Chariot
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.MOON_CHARIOTEER)
end

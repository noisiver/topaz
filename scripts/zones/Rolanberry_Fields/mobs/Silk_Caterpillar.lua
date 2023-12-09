-----------------------------------
-- Area: Rolanberry Fields
--  NM: Silk Caterpillar
-- Involved in quest Fear of Flying
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    tpz.voidwalker.onMobSpawn(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end
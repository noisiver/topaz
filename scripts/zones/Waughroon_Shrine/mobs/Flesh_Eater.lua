-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Flesh Eater
-- BCNM: The Worm's Turn
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.CHARMABLE, 1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

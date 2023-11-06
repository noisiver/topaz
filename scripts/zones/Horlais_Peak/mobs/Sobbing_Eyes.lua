-----------------------------------
-- Area: Horlais Peak
--  Mob: Sobbing Eyes
-- BCNM: Under Observation
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.EEM_SILENCE, 30)
    mob:setMod(tpz.mod.EEM_DARK_SLEEP, 5)
    mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 5)
    mob:setMod(tpz.mod.REGAIN, 100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

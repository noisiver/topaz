-----------------------------------
-- Area: Horlais Peak
--  Mob: Compound Eyes
-- BCNM: Under Observation
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.EEM_DARK_SLEEP, 5)
    mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 5)
    mob:setMod(tpz.mod.REGAIN, 100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

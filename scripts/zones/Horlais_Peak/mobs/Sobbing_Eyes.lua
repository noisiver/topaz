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
    mob:setMod(tpz.mod.SLEEPRES, 100)
    mob:setMod(tpz.mod.SILENCERES, 75)
    mob:setMod(tpz.mod.REGAIN, 1000)
end

function onMobDeath(mob, player, isKiller)
end

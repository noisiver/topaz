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
    mob:setMod(tpz.mod.SLEEPRES, 100)
    mob:setMod(tpz.mod.SILENCERES, 75)
    mob:setMod(tpz.mod.REGAIN, 1000)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

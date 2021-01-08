-----------------------------------
-- Area: Horlais Peak
--  Mob: Compound Eyes
-- BCNM: Under Observation
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(tpz.mod.SLEEPRES, 100)
    mob:setMod(tpz.mod.SILENCERES, 75)
    mob:addStatusEffect(tpz.effect.REGAIN, 1000, 3, 0)
end

function onMobDeath(mob, player, isKiller)
end

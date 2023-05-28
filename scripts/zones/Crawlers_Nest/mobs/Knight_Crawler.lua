-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Knight Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    -- Temp bandaid
    if mob:getID() == 17584322 then
        mob:setSpawn(-335,-1,-262)
    end
end

function onMobRoam(mob)
    -- Temp bandaid
    if mob:getID() == 17584322 then
        mob:setSpawn(-335,-1,-262)
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 692, 2, tpz.regime.type.GROUNDS)
end

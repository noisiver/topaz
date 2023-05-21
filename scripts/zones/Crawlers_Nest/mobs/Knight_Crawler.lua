-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Knight Crawler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
function onMobSpawn(mob)
    -- Temp bandaid
    if mob:getID() == 17584322 then
        mob:setSpawn(-335,-1,223)
    end
end
function onMobFight(mob, target)
    -- Temp bandaid
    if mob:getID() == 17584322 then
        mob:setSpawn(-335,-1,223)
    end
end

function onMobDeath(mob, player, isKiller)
    -- Temp bandaid
    if mob:getID() == 17584322 then
        mob:setSpawn(-335,-1,223)
    end
    tpz.regime.checkRegime(player, mob, 692, 2, tpz.regime.type.GROUNDS)
end

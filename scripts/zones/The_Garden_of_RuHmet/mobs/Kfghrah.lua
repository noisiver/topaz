-----------------------------------
-- Area: The Garden of Ru'Hmet
--  MOB: Kf'ghrah
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:AnimationSub(4)
    mob:setMobMod(tpz.mobMod.NO_STANDBACK, 1)
    mob:setMobMod(tpz.mobMod.NO_AGGRO, 1)
    mob:setMod(tpz.mod.REFRESH, 50) 
end

function onMonsterMagicPrepare(mob,target)
    if mob:AnimationSub() == 4 then
        if mob:getMainJob() == tpz.job.WHM then
            local spell = math.random(1, 3)
            if spell == 1 then
                return 112 -- Flash
            elseif spell == 2 then
                return 31 -- Banish IV
            elseif spell == 3 then
                return 40 -- Banishga III
            end
        else
            local spell = math.random(1, 3)
            if spell == 1 then
                return 254 -- Blind
            elseif spell == 2 then
                return 274 -- Sleepga II
            elseif spell == 3 then
                return 232 -- Bio III
            end
        end
    end
    return 0
end

function onMobDeath(mob, player, isKiller)
end

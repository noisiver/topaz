-----------------------------------
-- Area: The Ashu Talif (The Black Coffin & Scouting the Ashu Talif)
--  Mob: Ashu Talif Crew
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/The_Ashu_Talif/IDs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobEngaged(mob, target)
    -- Black Coffin
    local allies = mob:getInstance():getAllies()
    for i, v in pairs(allies) do
        if (v:isAlive()) then
            v:setLocalVar("ready", 1)
        end
    end

    local mobs = mob:getInstance():getMobs()
    for i, v in pairs(mobs) do
        if(v:isAlive()) then
            v:setLocalVar("ready", 1)
        end
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    instance:setProgress(instance:getProgress() + 1)
end

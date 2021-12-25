--[[
https://ffxiclopedia.fandom.com/wiki/Great_Ameretat

Ameretat mobs can optionally be modified by calling tpz.mix.ameretat.config(mob, params) from within onMobSpawn.

params is a table that can contain the following keys:
    sleepHour : changes hour at which ameretat crawlers naturally fall asleep (default: 20)
    wakeHour  : changes hour at which ameretat crawlers naturally wake (default: 5)

Example:

tpz.mix.ameretat.config(mob, {
    sleepHour = 20,
    wakeHour = 5,
})

--]]
require("scripts/globals/mixins")
require("scripts/globals/status")
-----------------------------------

tpz = tpz or {}
tpz.mix = tpz.mix or {}
tpz.mix.ameretat = tpz.mix.ameretat or {}

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

local function bedTime(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setLocalVar("ResleepTime", 0)
end

local function wakeUp(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    mob:setLocalVar("ResleepTime", 0)
end

tpz.mix.ameretat.config = function(mob, params)
    if params.sleepHour and type(params.sleepHour) == "number" then
        mob:setLocalVar("[ameretat]sleepHour", params.sleepHour)
    end
    if params.wakeHour and type(params.wakeHour) == "number" then
        mob:setLocalVar("[ameretat]wakeHour", params.wakeHour)
    end
end

g_mixins.families.ameretat = function(mob)
    -- these defaults can be overwritten by using tpz.mix.ameretat.config() in onMobSpawn.  sleepHour must be > wakeHour to function properly.
    mob:addListener("SPAWN", "AMERETAT_SPAWN", function(mob)
        mob:setLocalVar("[ameretat]sleepHour", 20)
        mob:setLocalVar("[ameretat]wakeHour", 5)
        mob:setMod(tpz.mod.REGEN, 20)
    end)

    mob:addListener("ROAM_TICK", "AMERETAT_ROAM_TICK", function(mob)
        local currentHour = VanadielHour()
        local sleepHour = mob:getLocalVar("[ameretat]sleepHour")
        local wakeHour = mob:getLocalVar("[ameretat]wakeHour")

        if (currentHour >= sleepHour or currentHour < mob:getLocalVar("[ameretat]wakeHour")) and not mob:isEngaged() then
            local resleepTime = mob:getLocalVar("ResleepTime")

            if resleepTime ~= 0 and mob:checkDistance(mob:getSpawnPos()) > 25 then
                mob:setLocalVar("ResleepTime", os.time() + 120) -- Reset sleep timer until crawler returns home
            elseif resleepTime <= os.time() then -- No timer was set (normal behavior) OR crawler has been back home for 2 minutes since disengaged
                bedTime(mob)
            end
        elseif currentHour < sleepHour and currentHour >= mob:getLocalVar("[ameretat]wakeHour") then
            wakeUp(mob)
        end
    end)

    mob:addListener("ENGAGE", "AMERETAT_ENGAGE", function(mob, target)
        wakeUp(mob)
     end)

    mob:addListener("DISENGAGE", "AMERETAT_DISENGAGE", function(mob)
        mob:setLocalVar("ResleepTime", os.time() + 120) -- Ameretat crawlers go back to sleep exactly 2 minutes after they were engaged.
    end)
end

return g_mixins.families.ameretat

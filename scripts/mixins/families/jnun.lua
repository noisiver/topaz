--[[
https://ffxiclopedia.fandom.com/wiki/Category:Crawlers

jnun mobs can optionally be modified by calling tpz.mix.jnun.config(mob, params) from within onMobSpawn.

params is a table that can contain the following keys:
    sleepHour : changes hour at which jnun crawlers naturally fall asleep (default: 18)
    wakeHour  : changes hour at which jnun crawlers naturally wake (default: 6)

Example:

tpz.mix.jnun.config(mob, {
    sleepHour = 20,
    wakeHour = 4,
})

--]]
require("scripts/globals/mixins")
require("scripts/globals/status")
-----------------------------------

tpz = tpz or {}
tpz.mix = tpz.mix or {}
tpz.mix.jnun = tpz.mix.jnun or {}

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

local function bedTime(mob)
    mob:AnimationSub(mob:AnimationSub() + 1)
    mob:setMobMod(tpz.mobMod.NO_AGGRO, 1)
    mob:setMobMod(tpz.mobMod.NO_LINK, 1)
    mob:setLocalVar("ResleepTime", 0)
end

local function wakeUp(mob)
    mob:AnimationSub(mob:AnimationSub() - 1)
    mob:setMobMod(tpz.mobMod.NO_AGGRO, 0)
    mob:setMobMod(tpz.mobMod.NO_LINK, 0)
    mob:setLocalVar("ResleepTime", 0)
end

tpz.mix.jnun.config = function(mob, params)
    if params.sleepHour and type(params.sleepHour) == "number" then
        mob:setLocalVar("[jnun]sleepHour", params.sleepHour)
    end
    if params.wakeHour and type(params.wakeHour) == "number" then
        mob:setLocalVar("[jnun]wakeHour", params.wakeHour)
    end
end

g_mixins.families.jnun = function(mob)
    -- these defaults can be overwritten by using tpz.mix.jnun.config() in onMobSpawn.  sleepHour must be > wakeHour to function properly.
    mob:addListener("SPAWN", "JNUN_SPAWN", function(mob)
        mob:setLocalVar("[jnun]sleepHour", 18)
        mob:setLocalVar("[jnun]wakeHour", 6)
    end)

    mob:addListener("ROAM_TICK", "JNUN_ROAM_TICK", function(mob)
        local currentHour = VanadielHour()
        local sleepHour = mob:getLocalVar("[jnun]sleepHour")
        local wakeHour = mob:getLocalVar("[jnun]wakeHour")
        local subAnimation = mob:AnimationSub()

        if subAnimation == 0 and (currentHour >= sleepHour or currentHour < mob:getLocalVar("[jnun]wakeHour")) and not mob:isEngaged() then
            local resleepTime = mob:getLocalVar("ResleepTime")

            if resleepTime ~= 0 and mob:checkDistance(mob:getSpawnPos()) > 25 then
                mob:setLocalVar("ResleepTime", os.time() + 120) -- Reset sleep timer until crawler returns home
            elseif resleepTime <= os.time() then -- No timer was set (normal behavior) OR crawler has been back home for 2 minutes since disengaged
                bedTime(mob)
            end
        elseif subAnimation == 1 and currentHour < sleepHour and currentHour >= mob:getLocalVar("[jnun]wakeHour") then
            wakeUp(mob)
        end
    end)

    mob:addListener("ENGAGE", "JNUN_ENGAGE", function(mob, target)
        if mob:AnimationSub() == 1 then
            wakeUp(mob)
        end
    end)

    mob:addListener("DISENGAGE", "JNUN_DISENGAGE", function(mob)
        mob:setLocalVar("ResleepTime", os.time() + 120) -- jnun go back to sleep exactly 2 minutes after they were engaged.
    end)
end

return g_mixins.families.jnun

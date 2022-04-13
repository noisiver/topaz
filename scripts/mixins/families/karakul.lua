--[[
https://ffxiclopedia.fandom.com/wiki/Category:Crawlers

karakul mobs can optionally be modified by calling tpz.mix.karakul.config(mob, params) from within onMobSpawn.

params is a table that can contain the following keys:
    sleepHour : changes hour at which karakul crawlers naturally fall asleep (default: 18)
    wakeHour  : changes hour at which karakul crawlers naturally wake (default: 6)

Example:

tpz.mix.karakul.config(mob, {
    sleepHour = 20,
    wakeHour = 4,
})

--]]
require("scripts/globals/mixins")
require("scripts/globals/status")
-----------------------------------

tpz = tpz or {}
tpz.mix = tpz.mix or {}
tpz.mix.karakul = tpz.mix.karakul or {}

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

local function bedTime(mob)
    mob:AnimationSub(mob:AnimationSub() + 1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setMobMod(tpz.mobMod.NO_AGGRO, 1)
    mob:setMobMod(tpz.mobMod.NO_LINK, 1)
    mob:setLocalVar("ResleepTime", 0)
end

local function wakeUp(mob)
    mob:AnimationSub(mob:AnimationSub() - 1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    mob:setMobMod(tpz.mobMod.NO_AGGRO, 0)
    mob:setMobMod(tpz.mobMod.NO_LINK, 0)
    mob:setLocalVar("ResleepTime", 0)
end

tpz.mix.karakul.config = function(mob, params)
    if params.sleepHour and type(params.sleepHour) == "number" then
        mob:setLocalVar("[karakul]sleepHour", params.sleepHour)
    end
    if params.wakeHour and type(params.wakeHour) == "number" then
        mob:setLocalVar("[karakul]wakeHour", params.wakeHour)
    end
end

g_mixins.families.karakul = function(mob)
    -- these defaults can be overwritten by using tpz.mix.karakul.config() in onMobSpawn.  sleepHour must be > wakeHour to function properly.
    mob:addListener("SPAWN", "karakul_SPAWN", function(mob)
        mob:setLocalVar("[karakul]sleepHour", 18)
        mob:setLocalVar("[karakul]wakeHour", 6)
    end)

    mob:addListener("ROAM_TICK", "karakul_ROAM_TICK", function(mob)
        local currentHour = VanadielHour()
        local sleepHour = mob:getLocalVar("[karakul]sleepHour")
        local wakeHour = mob:getLocalVar("[karakul]wakeHour")
        local subAnimation = mob:AnimationSub()

        if subAnimation == 0 and (currentHour >= sleepHour or currentHour < mob:getLocalVar("[karakul]wakeHour")) and not mob:isEngaged() then
            local resleepTime = mob:getLocalVar("ResleepTime")

            if resleepTime ~= 0 and mob:checkDistance(mob:getSpawnPos()) > 25 then
                mob:setLocalVar("ResleepTime", os.time() + 120) -- Reset sleep timer until crawler returns home
            elseif resleepTime <= os.time() then -- No timer was set (normal behavior) OR crawler has been back home for 2 minutes since disengaged
                bedTime(mob)
            end
        elseif subAnimation == 1 and currentHour < sleepHour and currentHour >= mob:getLocalVar("[karakul]wakeHour") then
            wakeUp(mob)
        end
    end)

    mob:addListener("ENGAGE", "karakul_ENGAGE", function(mob, target)
        if mob:AnimationSub() == 1 then
            wakeUp(mob)
        end
    end)

    mob:addListener("DISENGAGE", "karakul_DISENGAGE", function(mob)
        mob:setLocalVar("ResleepTime", os.time() + 120) -- karakul go back to sleep exactly 2 minutes after they were engaged.
    end)
end

return g_mixins.families.karakul

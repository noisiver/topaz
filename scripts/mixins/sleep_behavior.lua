require("scripts/globals/mixins")
require("scripts/globals/status")


g_mixins = g_mixins or {}

g_mixins.sleep_behavior = function(mob)

    mob:addListener("SPAWN", "SLEEP_SPAWN", function(mob)
        mob:setLocalVar("SleepAnimation", 1)
        mob:setLocalVar("SleepStart", 20)
        mob:setLocalVar("SleepEnd", 6)
        mob:setLocalVar("DelaySleep", os.time() + 15)
        mob:setLocalVar("aggro", mob:getAggressive())
        mob:setLocalVar("link", mob:getLink())
    end)

    mob:addListener("ROAM_TICK", "SLEEP_ROAM_TICK", function(mob)
        local currentAnimation = mob:AnimationSub()
        local sleepAnimation = mob:getLocalVar("SleepAnimation")
        local SleepStart = mob:getLocalVar("SleepStart")
        local SleepEnd = mob:getLocalVar("SleepEnd")
        local hour = VanadielHour()
        local shouldSleep = (SleepStart > SleepEnd and (hour >= SleepStart or hour < SleepEnd)) or (SleepStart < SleepEnd and hour >= SleepStart and hour < SleepEnd)
        local now = os.time()
        if currentAnimation ~= sleepAnimation and shouldSleep and now > mob:getLocalVar("DelaySleep") and mob:canRest() and not mob:isFarFromHome() then
            mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
            mob:setAggressive(0)
            mob:setLink(0)
            mob:AnimationSub(mob:getLocalVar("SleepAnimation"))
        elseif currentAnimation == sleepAnimation and not shouldSleep then
            mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
            mob:setAggressive(mob:getLocalVar("aggro"))
            mob:setLink(mob:getLocalVar("link"))
            mob:AnimationSub(0)
        end
    end)

    mob:addListener("ENGAGE", "SLEEP_ENGAGE", function(mob, target)
        if mob:AnimationSub() == mob:getLocalVar("SleepAnimation") then
            mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
            mob:setAggressive(mob:getLocalVar("aggro"))
            mob:setLink(mob:getLocalVar("link"))
            mob:AnimationSub(0)
        end
    end)

    mob:addListener("DISENGAGE", "SLEEP_DISENGAGE", function(mob)
        mob:setLocalVar("DelaySleep", os.time() + 30)
    end)
end

return g_mixins.sleep_behavior

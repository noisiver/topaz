-- Gnole family mixin
-- animsub 1= standing, animsub 0 = all fours

require("scripts/globals/mixins")
require("scripts/globals/utils")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.gnole = function(mob)
    mob:addListener("SPAWN", "GNOLE_SPAWN", function(mob)
        mob:setLocalVar("transformTime", os.time())
    end)

    mob:addListener("ROAM_TICK", "GNOLE_ROAM", function(mob)
        local currentHour = VanadielHour()
	    if currentHour >= 18 and currentHour < 6 then
		    mob:setMod(tpz.mod.REGEN, 30)
	    else
		    mob:setMod(tpz.mod.REGEN, 0)
	    end
        attemptTransform(mob, 300)
    end)

    mob:addListener("COMBAT_TICK", "GNOLE_COMBAT", function(mob)
        attemptTransform(mob, 60)
    end)

mob:addListener("ENGAGE", "GNOLE_ENGAGE", function(mob, target)
    local moon = utils.getMoonPhase()
    local moonphase = 0
    -- Set delay won't work and bugs them out with super increased attack speed
    if (moon == 'Full') then
        -- if (mob:AnimationSub() == 0) then
        --     mob:setDelay(156)
        -- elseif (mob:AnimationSub() == 1) then
        --     mob:setDelay(250)
        -- end
        mob:addMod(tpz.mod.EVA, 60)
    elseif (moon == 'Gibbeus') then
        -- if (mob:AnimationSub() == 0) then
        --     mob:setDelay(190)
        -- elseif (mob:AnimationSub() == 1) then
        --     mob:setDelay(300)
        -- end
        mob:addMod(tpz.mod.EVA, 30)
    elseif (moon == 'Quarter') then
        -- if (mob:AnimationSub() == 0) then
        --     mob:setDelay(218)
        -- elseif (mob:AnimationSub() == 1) then
        --     mob:setDelay(350)
        -- end
    elseif (moon == 'Cresecent') then
        -- if (mob:AnimationSub() == 0) then
        --     mob:setDelay(256)
        -- elseif (mob:AnimationSub() == 1) then
        --     mob:setDelay(410)
        -- end
        mob:addMod(tpz.mod.EVA, -30)
    elseif (moon == 'New') then
        -- if (mob:AnimationSub() == 0) then
        --     mob:setDelay(286)
        -- elseif (mob:AnimationSub() == 1) then
        --     mob:setDelay(460)
        -- end
        mob:addMod(tpz.mod.EVA, -60)
    end
end)
end

function attemptTransform(mob, timeThreshold)
    local transformTime = mob:getLocalVar("transformTime")
    local currentTime = os.time()
    if currentTime - transformTime >= timeThreshold then
        local animSub = mob:AnimationSub()
        animSub = (animSub + 1) % 2
        mob:AnimationSub(animSub)
        mob:setLocalVar("transformTime", currentTime)
    end
end

return g_mixins.families.gnole

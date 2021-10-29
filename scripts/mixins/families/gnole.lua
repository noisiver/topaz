-- Gnole family mixin

require("scripts/globals/mixins")

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
	   local moon = VanadielMoonPhase()
	   local moonphase = 0
		if moon > 90 then -- Full Moon
			mob:setMod(tpz.mod.MAIN_DMG_RATING, 150):
		else
			mob:setMod(tpz.mod.MAIN_DMG_RATING, 100)
		end
        attemptTransform(mob, 60)
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

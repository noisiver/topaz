require("scripts/globals/mixins")
require("scripts/globals/world")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.coppercap = function(mob)

    mob:addListener("TICK", "COPPERCAP_TICK", function(mob)
		if mob:getWeather() == tpz.weather.RAIN or mob:getWeather() == tpz.weather.SQUALL then
			mob:setMod(tpz.mod.REGEN, 30)
		else
			mob:setMod(tpz.mod.REGEN, 0)
		end
    end)

end

return g_mixins.families.coppercap

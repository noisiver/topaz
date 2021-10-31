-- Ladybug family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.ladybug = function(mob)

    mob:addListener("ROAM_TICK", "LADYBUG_ROAM", function(mob)
		if VanadielHour() >= 6 and VanadielHour() <= 18 then
			mob:setMobMod(tpz.mobMod.NO_AGGRO, 0)
		else
			mob:setMobMod(tpz.mobMod.NO_AGGRO, 1)
		end
	end)

    mob:addListener("COMBAT_TICK", "LADYBUG_COMBAT", function(mob)
		if VanadielHour() >= 6 and VanadielHour() <= 18 then
			mob:setMod(tpz.mod.REGAIN, 250)
			mob:setMod(tpz.mod.REGEN, 30)
		else
			mob:setMod(tpz.mod.REGAIN, 0)
			mob:setMod(tpz.mod.REGEN, 0)
		end
	end)
end

return g_mixins.families.ladybug

require("scripts/globals/mixins")
require("scripts/globals/magic")
require("scripts/globals/status")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.dahak = function(mob)

    mob:addListener("TICK", "DAHAK_TICK", function(mob)
		if mob:hasStatusEffect(tpz.effect.SILENCE) then
			mob:setMod(tpz.mod.REGAIN, 150)
		else
			mob:setMod(tpz.mod.REGAIN, 0)
		end
    end)

    mob:addListener("MAGIC_HIT", "DAHAK_MAGIC_HIT", function(caster, mob, spell)
        local fireEle = 1
        local waterEle = 6

        if (fireEle == spell:getElement()) and (caster:isPC() or caster:isPet()) then
            mob:addTP(400)
        elseif (waterEle == spell:getElement()) and (caster:isPC() or caster:isPet()) then
            mob:delTP(400)
        end
    end)

end

return g_mixins.families.dahak

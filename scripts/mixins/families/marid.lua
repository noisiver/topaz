require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.marid = function(mob)

    -- 20% chance to break horn on critical hit
    mob:addListener("CRITICAL_TAKE", "MARID_CRITICAL_TAKE", function(mob)
        if math.random(100) < 20 and mob:AnimationSub() == 0 then
            mob:AnimationSub(1)
			mob:setLocalVar("Weapon", 1)
		elseif math.random(100) < 20 and mob:AnimationSub() == 1 then
			mob:AnimationSub(2)
			mob:setLocalVar("Weapon", 2)
        end
    end)

end

return g_mixins.families.marid

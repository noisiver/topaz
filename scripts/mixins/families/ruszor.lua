require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

-- AnimationSub for Ruszor
-- 0 = Nothing
-- 1 = Icy Mist (PDT Shield)
-- 2 = Bubbles (MDT Shield)

g_mixins.families.ruszor = function(mob)
    
	mob:addListener("SPAWN", "RUSZOR_SPAWN", function(mob)
		mob:setBehaviour(bit.bor(mob:getBehaviour(), xi.behavior.NO_TURN))
        mob:AnimationSub(0)
    end)
	mob:addListener("TICK", "RUSZOR_TICK", function(mob)
		if mob:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) then
			mob:AnimationSub(1)
		elseif mob:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then 
			mob:AnimationSub(2)
		 else
			mob:AnimationSub(0)
		 end
    end)

end

return g_mixins.families.ruszor

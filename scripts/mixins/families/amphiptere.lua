-- Amphiptere family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.amphiptere = function(mob)
    mob:addListener("SPAWN", "AMPHIPTERE_SPAWN", function(mob)
		mob:setBehaviour(bit.bor(mob:getBehaviour(), xi.behavior.NO_TURN))
        mob:hideName(true)
        mob:untargetable(true)
        mob:AnimationSub(1)
    end)
    mob:addListener("ROAM_TICK", "AMPHIPTERE_ROAM", function(mob)
        mob:hideName(true)
        mob:untargetable(true)
        mob:AnimationSub(1)
    end)
	mob:addListener("COMBAT_TICK", "AMPHIPTERE_CTICK", function(mob)
        local ReavingWindAura = mob:getLocalVar("ReavingWindAura")
        local ReavingWindKnockback = mob:getLocalVar("ReavingWindKnockback")
		local animationSub = mob:AnimationSub()
		if ReavingWindAura > 0 and os.time() > ReavingWindAura then -- Remove knockback aura
			mob:AnimationSub(0)
			mob:setLocalVar("ReavingWindKnockback", 0)
		end
		
		if animationSub == 2 then
			if os.time() > ReavingWindKnockback then 
				mob:useMobAbility(2434) -- Knockback
				mob:setLocalVar("ReavingWindKnockback", os.time() + 3)
			end
		end
	end)
    mob:addListener("ENGAGE", "AMPHIPTERE_ENGAGE", function(mob, target)
        mob:hideName(false)
        mob:untargetable(false)
        mob:AnimationSub(0)
    end)
    mob:addListener("DISENGAGE", "AMPHIPTERE_DISENGAGE", function(mob, target)
        mob:hideName(true)
        mob:untargetable(true)
        mob:AnimationSub(1)
    end)
end

return g_mixins.families.amphiptere

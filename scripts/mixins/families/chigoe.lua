-- Chigoe family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.chigoe = function(mob)
    mob:addListener("SPAWN", "CHIGOE_SPAWN", function(mob)
        mob:hideName(true)
        mob:untargetable(true)
    end)
    mob:addListener("ENGAGE", "CHIGOE_ENGAGE", function(mob, target)
        mob:hideName(false)
        mob:untargetable(false)
    end)
    mob:addListener("DISENGAGE", "CHIGOE_DISENGAGE", function(mob, target)
        mob:hideName(true)
        mob:untargetable(true)
    end)
	
    mob:addListener("CRITICAL_TAKE", "IMP_CRITICAL_TAKE", function(mob)
		if mob:getHP() > 0 and not mob:isNM()then
			mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
			mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
			mob:setHP(0)
		end
    end)
	
	-- chance to break when hit by an offensive JA(like box step)
	mob:addListener("ABILITY_TAKE", "BREAK_CRITICAL_TAKE", function(mob, user, ability, action)
        local abilityID = ability:getID()
        if abilityID == 150      -- tomahawk
        or abilityID == 46       -- shield bash
        or abilityID == 77       -- weapon bash
        or abilityID == 66       -- jump
        or abilityID == 67       -- high jump
        or abilityID == 68       -- super jump
        or abilityID == 201      -- quick step
        or abilityID == 202      -- box step
        or abilityID == 203      -- stutter step
        or abilityID == 205      -- desperate flourish
        or abilityID == 207      -- violent flourish
        or abilityID == 168      -- blade bash
        or abilityID == 170 then -- angon
			if mob:getHP() > 0 and not mob:isNM()then
				mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
				mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
				mob:setHP(0)
			end
		end
	end)
	
end

return g_mixins.families.chigoe

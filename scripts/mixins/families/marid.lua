require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.marid = function(mob)
    -- set default 5% chance to break horn on critical hit taken
    -- this can be overridden in onMobSpawn

    mob:addListener("SPAWN", "MARID_SPAWN", function(mob)
        mob:setLocalVar("HornBreakChance", 5)
    end)

    mob:addListener("COMBAT_TICK", "MARID_COMBAT", function(mob)
        if mob:hasStatusEffect(tpz.effect.PHALANX) then
            mob:setMod(tpz.mod.UDMGPHYS, 40)
            mob:setMod(tpz.mod.UDMGBREATH, 40)
            mob:setMod(tpz.mod.UDMGMAGIC, 40)
            mob:setMod(tpz.mod.UDMGRANGE, 40)
        else
            mob:setMod(tpz.mod.UDMGPHYS, 0)
            mob:setMod(tpz.mod.UDMGBREATH, 0)
            mob:setMod(tpz.mod.UDMGMAGIC, 0)
            mob:setMod(tpz.mod.UDMGRANGE, 0)
        end
    end)

    -- 20% chance to break horn on critical hit
    mob:addListener("CRITICAL_TAKE", "MARID_CRITICAL_TAKE", function(mob)
        if math.random(100) <= mob:getLocalVar("HornBreakChance") and mob:AnimationSub() == 0 then
            mob:AnimationSub(1)
			mob:setLocalVar("Weapon", 1)
		elseif math.random(100) <= mob:getLocalVar("HornBreakChance") and mob:AnimationSub() == 1 then
			mob:AnimationSub(2)
			mob:setLocalVar("Weapon", 2)
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
        or abilityID == 170 then -- angon
			if math.random(100) <= mob:getLocalVar("HornBreakChance") and mob:AnimationSub() == 0 then
				mob:AnimationSub(1)
				mob:setLocalVar("Weapon", 1)
			elseif math.random(100) <= mob:getLocalVar("HornBreakChance") and mob:AnimationSub() == 1 then
				mob:AnimationSub(2)
				mob:setLocalVar("Weapon", 2)
			end
		end
		
	end)

end

return g_mixins.families.marid

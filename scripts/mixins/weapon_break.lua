require("scripts/globals/mixins")

g_mixins = g_mixins or {}

-- AnimationSub
-- 0 = main weapon out
-- 1 = main weapon broken
-- Lamia, Trolls, Mammols

g_mixins.weapon_break = function(mob)

    -- set default 10% chance to break weapon on critical hit taken
    -- this can be overridden in onMobSpawn

    mob:addListener("SPAWN", "WEAPON_BREAK", function(mob)
        mob:setLocalVar("BreakChance", 10)
    end)

    -- chance to break weapon when taking a critical hit

    mob:addListener("CRITICAL_TAKE", "BREAK_CRITICAL_TAKE", function(mob)
        if math.random(100) <= mob:getLocalVar("BreakChance") then
            local animationSub = mob:AnimationSub()

            -- break weapon
            if animationSub == 0 or animationSub == 4 then
                mob:AnimationSub(1)
            end
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
			if math.random(100) <= 5 then
				local animationSub = mob:AnimationSub()

				-- break weapon
				if animationSub == 0 or animationSub == 4 then
					mob:AnimationSub(1)
				end
			end
		end
	end)
end

return g_mixins.weapon_break

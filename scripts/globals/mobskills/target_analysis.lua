---------------------------------------------
-- Target Analysis
-- Randomly absorbs 1 to 7 attributes from target.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local mobhp = mob:getHPP()
	if mob:getPool() == 2973 then -- Airship Omega
		if mobhp > 25 then
			return 0
		else
			return 1
		end
	end
    if mob:getPool() == 3208 and mob:AnimationSub() == 1 then -- Proto-omega
        return 0
    else
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    return DrainMultipleAttributesPhysical(mob, target, skill, 21, 60, math.random(1, 7), 300)
end

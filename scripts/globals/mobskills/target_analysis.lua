---------------------------------------------
-- Target Analysis
-- Randomly absorbs 1 to 7 attributes from target.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local mobhp = mob:getHPP()
	if mob:getPool() == 2973 then
		if mobhp > 25 then
			return 0
		else
			return 1
		end
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (MobPhysicalHit(skill)) then
		skill:setMsg(DrainMultipleAttributes(mob, target, 10, 3, math.random(1, 7), 120))
	end

    return 1
end

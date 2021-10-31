---------------------------------------------
-- Ultimate Terror
--
-- Description: AoE Absorb All with randomness
-- Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (MobPhysicalHit(skill)) then
		skill:setMsg(DrainMultipleAttributes(mob, target, 10, 3, math.random(1, 7), 120))
	end
	return 1
end
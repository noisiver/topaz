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
    local count = math.random(1, 7)
    if (MobPhysicalHit(skill)) then
		skill:setMsg(DrainMultipleAttributes(mob, target, 10, 60, count, 300))
	end
    mob:setTP(0)
	return count
end

function onMobWeaponSkill(target, mob, skill)
    local count = math.random(1, 7)
    local shadows = math.random(2, 3)
    -- Check for shadows
    local dmg = MobFinalAdjustments(1, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, shadows)
    mob:setTP(0)
    if (MobPhysicalHit(skill)) then
		skill:setMsg(DrainMultipleAttributes(mob, target, 21, 60, count, 300))
        return count
	end
    return shadows
end
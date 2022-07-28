---------------------------------------------
-- Debilitating Drone
-- (NMs Only)
-- Drains all targets attributes for the duration.
-- AOE 15'
-- Ignores shadows.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:isNM() then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local count = 7
    local shadows = math.random(2, 3)
    -- Check for shadows
    local dmg = MobFinalAdjustments(1, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, shadows)
    if (MobPhysicalHit(skill)) then
		skill:setMsg(DrainMultipleAttributes(mob, target, 21, 60, count, 300))
        return count
	end
    return shadows
end

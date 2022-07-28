---------------------------------------------
-- Whispers of Ire
-- Randomly absorbs 1 to 7 attributes from target.
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
    local shadows = math.random(2, 3)
    -- Check for shadows
    local dmg = MobFinalAdjustments(1, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, shadows)
    if (MobPhysicalHit(skill)) then
		skill:setMsg(DrainMultipleAttributes(mob, target, 21, 60, count, 300))
        return count
	end
    return shadows
end

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
	local amount = 1
    local dmg = MobFinalAdjustments(amount, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_2_SHADOW)
	if (skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) then 
		skill:setMsg(DrainMultipleAttributes(mob, target, 10, 3, math.random(1, 7), 120))
	end

    return 1
end

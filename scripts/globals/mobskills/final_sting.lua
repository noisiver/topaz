---------------------------------------------
--  Final Sting
--
--  Description: Deals damage proportional to HP. Reduces HP to 1 after use. Damage varies with TP.
--  Type: Breath
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
	if (mob:getPool() == 385) or (mob:getPool() == 1925)  then 
		return 1
	else
		return 0
	end
end

function onMobWeaponSkill(target, mob, skill)
    local damage = MobBreathMove(mob, target, 0.20, 1, tpz.magic.ele.NONE, 1250)
    local dmg = MobFinalAdjustments(damage, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.NONE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.NONE)
    mob:setHP(0)
    return dmg
end

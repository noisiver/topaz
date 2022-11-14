---------------------------------------------------
-- Rail Cannon 2 gears
-- 2 Gears: Rail Cannon is directional (fan-shaped) AoE and ignores Utsusemi
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if (mob:AnimationSub() == 1) then --Needs to be tested
		return 0
	else
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 9
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.LIGHT, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHT, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)

    return dmg
end

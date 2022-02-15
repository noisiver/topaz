---------------------------------------------
-- Discoid
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local needles = 4400 / skill:getTotalTargets()
    local dmg = MobFinalAdjustments(needles, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHT, MOBPARAM_WIPE_SHADOWS)
	if target:hasStatusEffect(tpz.effect.FEALTY) then
        dmg = 0
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
	else
        target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
	end

    return dmg
end

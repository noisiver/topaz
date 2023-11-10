---------------------------------------------
-- 10000 Needles
--
-- Description: Shoots multiple needles at enemies within range.
-- Type: Physical
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local needles = 4000 / skill:getTotalTargets()
    local dmg = MobFinalAdjustments(needles, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_WIPE_SHADOWS)
	if target:hasStatusEffect(tpz.effect.FEALTY) then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
	else
		target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	end

    return dmg
end

---------------------------------------------
-- ??? Needles
--
-- Description: Shoots multiple needles at enemies within range.
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
    local needles = math.random(15000, 55000) / skill:getTotalTargets()
    local dmg = MobFinalAdjustments(needles, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_WIPE_SHADOWS)
	if target:hasStatusEffect(tpz.effect.FEALTY) then
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
	else
        dmg = target:physicalDmgTaken(dmg, tpz.damageType.BLUNT)
		target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
		if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
	end

    return dmg
end

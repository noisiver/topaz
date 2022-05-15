---------------------------------------------------
-- Heavy Strike Ullikummi
-- Damage varies with TP.
-- 0% TP: 2.25 / 150% TP: 3.50 / 300% TP: 4.75
-- Knocks back
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_CRIT_VARIES, 1.45, 1.55, 1.75)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
	
	local typeEffect = tpz.effect.SLOW

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    if (MobPhysicalHit(skill)) then
		mob:resetEnmity(target) 
	end
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1250, 0, 300)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end

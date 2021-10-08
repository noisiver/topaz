---------------------------------------------
-- Pyrrhic Kleos
-- Description: Delivers a fourfold attack that lowers target's evasion
-- Type: Physical
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(tpz.msg.basic.READIES_WS, 0, 29)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 4
    local accmod = 1
    local dmgmod = 0.7
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.PIERCING, MOBPARAM_IGNORE_SHADOWS)
	
    local typeEffect = tpz.effect.EVASION_DOWN

	target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50, 0, 45)
  	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
   return dmg
end

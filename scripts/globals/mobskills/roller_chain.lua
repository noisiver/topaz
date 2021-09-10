---------------------------------------------
--  Roller Chain 
--
--  AoE damage and Bind, blinkable by 2-3 Utsusemi shadows. Used only when the door is closed.
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if  mob:AnimationSub() == 0 or mob:AnimationSub() == 0 then --Needs testing for proper animation sub
		return 0
	else
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_3_SHADOW)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    local typeEffect = tpz.effect.BIND

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 20)
    return dmg
end

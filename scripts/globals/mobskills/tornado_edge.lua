---------------------------------------------
--  Tornado Edge
--
--  Description: Deals damage in a frontal cone.. Additional effect: HP, MP, TP down.
--  Type: Physical
--  Utsusemi/Blink absorb: 2 shadow1.
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 2
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_2_SHADOW)

    local typeEffect = tpz.effect.MAX_HP_DOWN
    local typeEffectTwo = tpz.effect.MAX_MP_DOWN

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50, 0, 30)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffectTwo, 50, 0, 30)


    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    if (MobPhysicalHit(skill)) then
        target:delTP(2000)
    end
	
    return dmg
end

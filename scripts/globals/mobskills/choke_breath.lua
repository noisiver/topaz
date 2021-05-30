---------------------------------------------------
-- Choke Breath
-- Damages enemies in a fan-shaped area of effect. Additional effect: Paralysis & Silence
-- Type: Physical
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: 3 shadows
-- Range: Melee
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
    local dmgmod = 3
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_3_SHADOW)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
    local typeEffect = tpz.effect.PARALYSIS
    local typeEffectTwo = tpz.effect.SILENCE
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50, 0, 30)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffectTwo, 1, 0, 30)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end

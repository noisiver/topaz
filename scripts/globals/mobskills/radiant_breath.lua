---------------------------------------------
--  Radiant Breath
--
--  Description: Deals light damage to enemies within a fan-shaped area of effect originating from the caster. Additional effect: Slow and Silence.
--  Type: Magical (Light)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = tpz.effect.SLOW
    local typeEffectTwo = tpz.effect.SILENCE

    MobStatusEffectMove(mob, target, typeEffectOne, 1250, 0, 300)
    MobStatusEffectMove(mob, target, typeEffectTwo, 1, 0, 300)

    local dmgmod = MobBreathMove(mob, target, 0.10, 1, tpz.magic.ele.LIGHT, 900)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.LIGHT, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.LIGHT)
    return dmg
end

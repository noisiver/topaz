---------------------------------------------
--  Bad Breath
--
--  Description: Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Earth)
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

    MobStatusEffectMove(mob, target, tpz.effect.SLOW, 2500, 0, 300)
    MobStatusEffectMove(mob, target, tpz.effect.POISON, mob:getMainLvl() / 2, 3, 300)
    MobStatusEffectMove(mob, target, tpz.effect.SILENCE, 1, 0, 300)
    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 25, 0, 300)
    MobStatusEffectMove(mob, target, tpz.effect.BLINDNESS, 50, 0, 300)
    MobStatusEffectMove(mob, target, tpz.effect.WEIGHT, 50, 0, 300)

    local dmgmod = MobBreathMove(mob, target, 0.15, 1, tpz.magic.ele.EARTH, 500)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.EARTH)
    MobStatusEffectMove(mob, target, tpz.effect.BIND, 1, 0, 45)

    return dmg
end

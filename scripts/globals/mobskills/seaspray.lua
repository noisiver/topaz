---------------------------------------------
-- Seaspray
-- Inflicts damage. Additional Effect: Slow. Ignores shadows.
-- Breath damage.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.10, 1, tpz.magic.ele.WATER, 500)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.SLOW

    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.WATER)
    MobStatusEffectMove(mob, target, typeEffect, 3500, 0, 120)
    return dmg
end

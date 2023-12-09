---------------------------------------------
-- Potted Plant
--
-- Description: AoE magical damage Additional effect: Bind and Slow (-50%)
-- Type: Magical
-- Element: Earth
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BIND
    local dmgmod = 7.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg , mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.EARTH)
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 20)
    MobHasteOverwriteSlowMove(mob, target, 5000, 0, 90, 0, 0, 2)
    return dmg
end
---------------------------------------------
-- Aeolian Void
--
-- Description: Fan AoE damage plus Silence and Blind
-- Type: Earth Damage/Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.WIND, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_IGNORE_SHADOWS)

    local typeEffectOne = tpz.effect.SILENCE
    local typeEffectTwo = tpz.effect.BLINDNESS

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    MobStatusEffectMove(mob, target, typeEffectOne, 1, 0, 300)
    MobStatusEffectMove(mob, target, typeEffectTwo, 20, 0, 300)

    return dmg
end

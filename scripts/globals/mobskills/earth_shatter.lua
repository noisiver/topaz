---------------------------------------------------
-- Earth Shatter
-- Deals Earth elemental damage to enemies within area of effect. Additional effect: Slow, Gravity, Rasp, Accuracy Down, and Evasion Down.
-- Very long cast time, easy to stun or run away from.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local result = 1
    local mobhp = mob:getHPP()

    if (mobhp <= 25) then
        result = 0
    end

    return result
end

function onMobWeaponSkill(target, mob, skill)

    MobStatusEffectMove(mob, target, tpz.effect.SLOW, 50, 0, 30)
    MobStatusEffectMove(mob, target, tpz.effect.WEIGHT, 50, 0, 30)
    MobStatusEffectMove(mob, target, tpz.effect.ACCURACY_DOWN, 50, 0, 30)
    MobStatusEffectMove(mob, target, tpz.effect.EVASION_DOWN, 50, 0, 30)
    MobStatusEffectMove(mob, target, tpz.effect.RASP, 25, 3, 30)


    local dmgmod = 1.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.EARTH)
    return dmg
end

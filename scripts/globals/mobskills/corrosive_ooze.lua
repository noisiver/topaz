---------------------------------------------------
--  Corrosive Ooze
--  Family: Slugs
--  Description: Deals FIRE damage to an enemy. Additional Effect: Attack Down and Defense Down.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Radial
--  Notes:
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = tpz.effect.ATTACK_DOWN
    local typeEffectTwo = tpz.effect.DEFENSE_DOWN
    local duration = 90

    MobStatusEffectMove(mob, target, typeEffectOne, 33, 0, duration)
    MobStatusEffectMove(mob, target, typeEffectTwo, 33, 0, duration)

    local dmgmod = 1.5
    local baseDamage = mob:getWeaponDmg()*1.5
    local info = MobMagicalMove(mob, target, skill, baseDamage, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    return dmg
end

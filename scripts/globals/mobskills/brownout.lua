---------------------------------------------
--  Brownout
--
--  Description: Deals Lightning damage in an area of effect.
--  Additional effect: Blind and Slow
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Conal
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
    local typeEffectOne = tpz.effect.BLINDNESS
    local typeEffectTwo = tpz.effect.SLOW
    local dmgmod = 5.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.THUNDER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING)
    MobStatusEffectMove(mob, target, typeEffectOne, 50, 0, 60)
    MobStatusEffectMove(mob, target, typeEffectTwo, 3550, 0, 60)
    return dmg
end

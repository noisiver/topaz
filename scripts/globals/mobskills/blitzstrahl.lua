---------------------------------------------
--  Blitzstrahl
--
--  Description: Deals lightning damage to an enemy. Additional effect: "Stun."
--  Type: Magical (Lightning)
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
    local typeEffect = tpz.effect.STUN

    local dmgmod = 1.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.THUNDER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING)
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 8)
    return dmg
end

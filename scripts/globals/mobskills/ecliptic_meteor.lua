---------------------------------------------
--  Ecliptic Meteor
--
--  Description: Deals DARK damage to enemies within area of effect.
--  Type: Magical DARK (Element)
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
    local dmgmod = 3.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    MobStatusEffectMove(mob, target, tpz.effect.BLINDNESS, 50, 3, 300)
    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 25, 3, 300)
    MobStatusEffectMoveSub(mob, target, tpz.effect.BIO, 10, 3, 180, 0, 15, 3)
    return dmg
end

---------------------------------------------------
-- Glacial Bellow
-- Deals ice damage to enemies within range. Additional Effect: Stun
-- Damage is decreased by distance.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/utils")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.STUN
    local dmgmod = 9
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.ICE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)
    local distance = mob:checkDistance(target)
    distance = utils.clamp(distance, 0, 50)
    dmg = dmg * ((50 - distance) / 50)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.ICE)
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 8)
    return dmg
end

---------------------------------------------------
-- Earthen Fury
-- Deals Earth elemental damage to enemies within area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 6, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.EARTH)
    return dmg
end

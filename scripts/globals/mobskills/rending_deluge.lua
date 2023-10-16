---------------------------------------------------
-- Rending Deluge
-- Deals water damage to enemies within range. Additional effect: Dispel.
---------------------------------------------
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)

    MobDispelMove(mob, target, skill, tpz.magic.ele.DARK, tpz.effectFlag.DISPELABLE)

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
    return dmg
end

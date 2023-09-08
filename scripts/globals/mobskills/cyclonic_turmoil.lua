---------------------------------------------
-- Cyclonic Turmoil
--
-- Deals Wind damage in an area of effect. Additional effect: Knockback & Dispel
-- Notes: Dispels multiple buffs. Wipes shadows.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 9
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*2.8, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    MobFullDispelMove(mob, target, skill, tpz.effectFlag.DISPELABLE)

    return dmg
end

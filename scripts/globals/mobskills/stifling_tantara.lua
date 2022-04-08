---------------------------------------------
-- Stifling Tantara
--
-- Description: Inflicts silence in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 10'
-- Notes: Doesn't use this if its horn is broken.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SILENCE

    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 300)
    return dmg
end

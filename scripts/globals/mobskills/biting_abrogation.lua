---------------------------------------------
-- Biting Abrogation
--
--  Description: Deals ice damage
-- Additional effect: Paralysis + 4 buff dispel + knockback
--  Type: Magical
-- Element: Ice
--  Utsusemi/Blink absorb: Ignores shadows.
--  Range: Single target, '18 Range
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
    local typeEffect = tpz.effect.PARALYSIS
    local power = 50
    local dmgmod = 2.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.ICE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.ICE)
    MobStatusEffectMove(mob, target, typeEffect, power, 0, 90)
    target:dispelStatusEffect()
    target:dispelStatusEffect()
    target:dispelStatusEffect()
    target:dispelStatusEffect()
    return dmg
end

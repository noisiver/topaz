---------------------------------------------
--  Promyvion Brume
--
--  Description: AoE Additional effect: poison
--  Type: Elemental based on current core element.
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 10' cone
--  Notes: Resets hate.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.POISON
    local dmgmod = 3.0
    local element = mob:getLocalVar("element", element)
    printf("Element: %i", element)
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, element, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, element, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, element)
    MobStatusEffectMove(mob, target, typeEffect, 9, 3, 90)
    mob:resetEnmity(target)
    return dmg
end

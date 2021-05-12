---------------------------------------------
-- Firefly Fandango
--
-- Description: AoE fire damage, Paralysis, Flash, and Max MP Down
-- Type: Enhancing
-- Element: Fire
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg , mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.FLASH
    local typeEffectTwo = tpz.effect.PARALYSIS
    local typeEffectThree = tpz.effect.MAX_MP_DOWN

    MobStatusEffectMove(mob, target, typeEffect, 300, 3, 12)
    MobStatusEffectMove(mob, target, typeEffectTwo, 33, 0, 30)
    MobStatusEffectMove(mob, target, typeEffectThree, 25, 0, 30)


    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    return dmg
end







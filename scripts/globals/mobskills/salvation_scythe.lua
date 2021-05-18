---------------------------------------------
--  Salvation Scythe
--
--  Description: Deals area of effect Darkness elemental damage in a 15' radius AOE. Additional Effect: Poison, Paralyze, Slow, Bio.
--  Type:  Magical
--
--
--  Utsusemi/Blink absorb: Ignores Shadows
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobStatusEffectMove(mob, target, tpz.effect.POISON, 10, 3, 30)
    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 15, 1, 30)
    MobStatusEffectMove(mob, target, tpz.effect.SLOW, 1250, 1, 30)
    MobStatusEffectMove(mob, target, tpz.effect.BIO, 20, 3, 30)

    local dmgmod = 1.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_2_SHADOW)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    return dmg
end

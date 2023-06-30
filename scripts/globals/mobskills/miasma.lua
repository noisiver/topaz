---------------------------------------------
--  Miasma
--
--  Description: Releases a toxic cloud on nearby targets. Additional effects: Slow + Poison + Plague
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Less than or equal to 10.0
--  Notes: Only used by Gulool Ja Ja.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local duration = 300


    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.EARTH)
    MobStatusEffectMove(mob, target, tpz.effect.POISON, 25, 3, 90)
    MobStatusEffectMove(mob, target, tpz.effect.PLAGUE, 3, 3, 300)
    MobStatusEffectMove(mob, target, tpz.effect.SLOW, 2550, 0, 300)
    return dmg
end

---------------------------------------------------
-- Pestilent Plume
-- Deals Dark damage to enemies within range.
-- Additional effect: Additional effects: Plague (-50 TP/tic), Blind (-50 Accuracy), -25 MDB for 60 seconds. 
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    MobStatusEffectMove(mob, target, tpz.effect.PLAGUE, 5, 3, 300)
    MobStatusEffectMove(mob, target, tpz.effect.BLINDNESS, 50, 0, 300)
    MobStatusEffectMove(mob, target, tpz.effect.MAGIC_DEF_DOWN, 25, 0, 300)
    return dmg
end

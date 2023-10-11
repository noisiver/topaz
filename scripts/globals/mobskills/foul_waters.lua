---------------------------------------------------
-- Foul Waters
-- Deals Water damage to enemies within range.
-- Additional effect: Drown (-33 STR & 15 damage/tic)
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 3.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WATER, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
    MobStatusEffectMove(mob, target, tpz.effect.DROWN, 15, 3, 300)
    MobStatusEffectMove(mob, target, tpz.effect.WEIGHT, 76, 0, 300)
    return dmg
end

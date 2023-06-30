---------------------------------------------------
-- Sandspin
-- Deals earth damage to enemies within range. Additional Effect: Accuracy Down.
-- Area of Effect is centered around caster.
-- The Additional Effect: Accuracy Down may not always process.
-- Duration: Three minutes ?
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.ACCURACY_DOWN


    local dmgmod = 2.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.EARTH, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.EARTH)
    MobStatusEffectMove(mob, target, typeEffect, 25, 0, 300)
    return dmg

end

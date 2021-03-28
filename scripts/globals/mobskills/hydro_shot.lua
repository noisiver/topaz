---------------------------------------------------
-- Hydro Shot
-- Additional effect: Enmity Down. Chance of effect varies with TP.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)



    local dmgmod = 1.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 1.5, tpz.magic.ele.WATER, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.ENMITY_DOWN

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 10, 3, 120)


    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
	mob:resetEnmity(target)
    return dmg
end

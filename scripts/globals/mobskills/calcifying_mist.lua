---------------------------------------------
-- Calcifying Mist
--
-- Description: Inflicts damage. Additional Effect: Petrification after 20 seconds.
-- Type: Physical
-- Utsusemi/Blink absorb: Ignore
-- Range: 10' radial
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:isNM() then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WATER, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)
    local typeEffect = tpz.effect.GRADUAL_PETRIFICATION

	target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
	MobStatusEffectMove(mob, target, typeEffect, 10, 3, 30)

    return dmg
end

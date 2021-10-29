---------------------------------------------
--  Backdraft
--
--  Description: Inflicts damage. Additional Effect: Gravity and Burn
--  Type:  Magical
--
--
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 9' aoe
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
	return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BURN
    local power = (mob:getMainLvl()/5 *.6 + 10)
    local typeEffectTwo = tpz.effect.WEIGHT


    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)
    MobStatusEffectMove(mob, target, typeEffect, 50, 0, 120)
    return dmg
end

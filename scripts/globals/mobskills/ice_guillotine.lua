---------------------------------------------
--  Ice Guillotine
--
--  Description: Frontal AoE Ice damage and Max HP Down. Used exclusively by Scylla.
--  Type: Physical
--  Utsusemi/Blink absorb: Ignores Shadows.
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = 1.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.ICE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)
	local typeEffect = tpz.effect.MAX_HP_DOWN
	local typeEffectTwo = tpz.effect.PARALYSIS
	local typeEffectThree = tpz.effect.AMNESIA
		
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.ICE)
	MobStatusEffectMove(mob, target, typeEffect, 33, 0, 180)
	MobStatusEffectMove(mob, target, typeEffectTwo, 20, 0, 120)
	MobStatusEffectMove(mob, target, typeEffectThree, 1, 0, 30)

	return dmg
end

---------------------------------------------
--  Chaos Blade
--
--  Description: Deals Dark damage to enemies within a fan-shaped area. Additional effect: Curse
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores Shadows
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
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
	
	local ChaosBladeBoost = mob:getLocalVar("ChaosBladeBoost")
	   
	 -- curse LAST so you don't die
	if ChaosBladeBoost == 1 then
	    local typeEffect = tpz.effect.CURSE_I
		MobStatusEffectMove(mob, target, typeEffect, 75, 0, 420)
	else
		local typeEffect = tpz.effect.CURSE_I
		MobStatusEffectMove(mob, target, typeEffect, 50, 0, 420)
	end

    return dmg
end

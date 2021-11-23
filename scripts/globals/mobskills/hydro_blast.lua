---------------------------------------------
-- Hydro Blast
--
-- Description: Inflicts damage. Additional effect: Grants the user Magic Shield.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: AOE
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local accmod = 1
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
    local typeEffect = tpz.effect.MAGIC_SHIELD
    
	target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
    MobBuffMove(mob, typeEffect, 1, 0, 60)

    return dmg
end

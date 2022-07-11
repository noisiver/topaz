---------------------------------------------
--  Aqua Fortis
--
--  Description: Inflicts damage. Additional Effect: Knockback + Poison.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
--  Notes: Autoa-ttack used by Groot Slang(ANNM)
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	local CurrentTP = mob:getTP()
	mob:setLocalVar("TP", CurrentTP)
	return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
    local typeEffect = tpz.effect.POISON
    local power = 20
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
 	MobStatusEffectMove(mob, target, typeEffect, power, 3, 300)
	local CurrentTP = mob:getLocalVar("TP")
	local AddTP = CurrentTP + 200
    target:addTP(20)
    mob:addTP(AddTP)
	return dmg
end


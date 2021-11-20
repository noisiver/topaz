---------------------------------------------
-- Ochre Blast Alt
--
-- Description: Deals earth damage to a single target
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Notes: Used only by Ouryu and Cuelebre when in the sky.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	local CurrentTP = mob:getTP()
	mob:setLocalVar("TP", CurrentTP)
		return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)
	
	local CurrentTP = mob:getLocalVar("TP")
	local AddTP = CurrentTP + 100
   target:addTP(20)
   mob:addTP(AddTP)

	
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.EARTH)
    return dmg
end
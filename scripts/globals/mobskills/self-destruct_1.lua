---------------------------------------------------
-- self_destruct_razon
-- Weapon skill for Fire in the sky(ENM)
-- 1 Cluster
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")

function onMobSkillCheck(target, mob, skill)
	if mob:AnimationSub() == 2 then
		return 0
	else
	end
	
	return 1
end

function onMobWeaponSkill(target, mob, skill)
local dmgmod = 2       -- changed from 1
	BOMB_TOSS_HPP = skill:getMobHPP() / 100

local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3*BOMB_TOSS_HPP, tpz.magic.ele.FIRE, dmgmod, TP_MAB_BONUS, 1)
local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
	if (mob:getPool() == 3333) then-- Razon 
		local amount = 1500 * skill:getTotalTargets()
		local dmg = MobFinalAdjustments(amount, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)
	end
mob:setHP(0)
target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)

		return dmg
end

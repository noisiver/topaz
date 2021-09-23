---------------------------------------------------
-- self_destruct_razon
-- Weapon skill for Fire in the sky(ENM)
-- 2 Clusters
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")

function onMobSkillCheck(target, mob, skill)
	if mob:AnimationSub() == 1 then
		return 0
	end
	
	return 1
end

function onMobWeaponSkill(target, mob, skill)
	if (mob:getPool() == 3333) then-- Razon 
		local HP = mob:getHP()
		local amount = 750 * skill:getTotalTargets()
		local dmg = MobFinalAdjustments(amount, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)
		target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
		if HP < 1300 then
		   dmg = 0
		end
			return dmg
	else
		local dmgmod = 2       -- changed from 1
			BOMB_TOSS_HPP = skill:getMobHPP() / 100

		local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*6*BOMB_TOSS_HPP, tpz.magic.ele.FIRE, dmgmod, TP_MAB_BONUS, 1)
		local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
		mob:AnimationSub(2)
		target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
			return dmg
	end
end

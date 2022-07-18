---------------------------------------------------
-- self_destruct_razon
-- Weapon skill for Fire in the sky(ENM)
-- 3 Clusters
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")

function onMobSkillCheck(target, mob, skill)
	if mob:AnimationSub() == 0 then
		return 0
	end
	
	return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 30
    local BOMB_TOSS_HPP = skill:getMobHPP() / 100
    dmgmod = math.floor(dmgmod * BOMB_TOSS_HPP)
    if dmgmod < 1 then dmgmod = 1 end

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*12*BOMB_TOSS_HPP, tpz.magic.ele.FIRE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
	if (mob:getPool() == 3333) then-- Razon 
		local HP = mob:getHPP()
		local amount = 650 * skill:getTotalTargets()
		local dmg = MobFinalAdjustments(amount, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)
		if HP < 66 then
		   dmg = 0
		end
        target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
        return dmg
	end
    mob:AnimationSub(1)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)

	return dmg
end

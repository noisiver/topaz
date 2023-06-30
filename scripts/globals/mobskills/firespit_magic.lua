---------------------------------------------
--  Firespit
--
--  Description: Deals fire damage to an enemy.
--  Type: Magical (Fire)
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:getPool() == 1773 then -- Gotoh Zha the Redolent
        if mob:AnimationSub() < 1 then
            return 1
        end
    end
	if mob:getMainJob() == tpz.job.BLM or mob:getMainJob() == tpz.job.WHM then
		return 0
	end
    
	return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 4.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)

    local distance = mob:checkDistance(target)
    distance = utils.clamp(distance, 0, 50)
    dmg = dmg * ((50 - distance) / 50)

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    return dmg
end

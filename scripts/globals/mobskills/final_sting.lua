---------------------------------------------
--  Final Sting
--
--  Description: Deals damage proportional to HP. Reduces HP to 1 after use. Damage varies with TP.
--  Type: Breath
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
	if (mob:getPool() == 385) or (mob:getPool() == 1925)  then 
		return 1
	else
		return 0
	end
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 30
    local BOMB_TOSS_HPP = skill:getMobHPP() / 100
    dmgmod = math.floor(dmgmod * BOMB_TOSS_HPP)
    if dmgmod < 1 then dmgmod = 1 end

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*12*BOMB_TOSS_HPP, tpz.magic.ele.NONE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.NONE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.NONE)
    mob:setHP(0)
    return dmg
end

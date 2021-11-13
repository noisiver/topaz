---------------------------------------------------
-- Meltdown
-- Reactor failure causes self-destruct, dealing magic damage to targets in an area of effect.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:getPool() == 1049 then --Disaster Idol
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2       -- changed from 1
        BOMB_TOSS_HPP = skill:getMobHPP() / 100

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*12*BOMB_TOSS_HPP, tpz.magic.ele.NONE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL, MOBPARAM_IGNORE_SHADOWS)
    mob:setHP(0)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL)
    return dmg
end

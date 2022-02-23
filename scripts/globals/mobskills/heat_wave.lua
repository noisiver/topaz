---------------------------------------------
--  Heat Wave
--
--  Description: Deals fire damage that lowers Agility and gradually reduces HP of enemies within range.
--  Type: Magical (Fire)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
	if (mob:getPool() == 1426) or (mob:getPool() == 416) or (mob:getPool() == 6587) and mob:AnimationSub() >= 0
    or (mob:getPool() == 9057) and mob:AnimationSub() >= 0 then 
		return 0
	else
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BURN

    local power = (mob:getMainLvl()/5 *.6 + 25)

    MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)

    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*1, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    return dmg
end

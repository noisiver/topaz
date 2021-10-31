---------------------------------------------
-- Warped Wail
-- 20' AoE Inflicts severe Max HP Down and Max MP Down.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local result = 1
    local mobhp = mob:getHPP()
    if mob:isMobType(MOBTYPE_NOTORIOUS) then
		if (mobhp <= 50) then
			result = 0
		end
    end
    return result
end


function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
    local typeEffect = tpz.effect.MAX_HP_DOWN
    local typeEffectTwo = tpz.effect.MAX_MP_DOWN
	    
	target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 60))
	MobStatusEffectMove(mob, target, typeEffectTwo, 50, 0, 60)

    return dmg
end

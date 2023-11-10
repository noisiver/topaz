---------------------------------------------
-- Mayhem Lantern
-- Description: Inflicts damage and charms players.
--	Additional Effect: Shock and attack boost.
--	Ignores shadows.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:AnimationSub() == 1 then
        return 1
    else
        return 0
    end
end

function onMobWeaponSkill(target, mob, skill)
    local power = 100  
	local powerTwo = (mob:getMainLvl()/5 *.6 + 25)
    local duration = 90
    local typeEffect = tpz.effect.ATTACK_BOOST
    local typeEffectTwo = tpz.effect.SHOCK
	MobBuffMove(mob, typeEffect, power, 0, duration) -- Attack Boost
	MobStatusEffectMove(mob, target, typeEffectTwo, powerTwo, 3, 300) -- Shock

    if target:hasStatusEffect(tpz.effect.FEALTY) then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
    else
		skill:setMsg(MobStatusEffectMove(mob, target, tpz.effect.CHARM, 1, 0, 60))
    end

    local dmgmod = 3
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*1, tpz.magic.ele.THUNDER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING)
   
   return tpz.effect.CHARM
end

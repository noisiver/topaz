---------------------------------------------
-- Frog Song
--
-- Description: AOE Charm
-- Type: Enhancing
-- Utsusemi/Blink absorb: Ignore
-- Range: Melee
-- Notes: 
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
	local message = tpz.msg.basic.SKILL_MISS
	local typeEffect = tpz.effect.CHARM_I
	local power = 0

	if (not target:isPC()) then
		skill:setMsg(tpz.msg.basic.SKILL_MISS)
		return typeEffect
	end

	local msg = MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)
	if target:hasStatusEffect(tpz.effect.FEALTY) then
		skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
	else
		if (msg == tpz.msg.basic.SKILL_ENFEEB_IS) then
		mob:charm(target)
		target:costume(2239) --Frog
	end
		 skill:setMsg(msg)
	end

    return typeEffect
end

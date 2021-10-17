---------------------------------------------
-- Charm
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = tpz.effect.CHARM_I	
	
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
		end
			 skill:setMsg(msg)
		end

    return typeEffect
end

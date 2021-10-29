---------------------------------------------
-- Soothing Aroma
-- Family: Rafflesia
-- Description: Charms nearby players.
-- Type:
-- Utsusemi/Blink absorb:
-- Range:
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getHPP() > 50 and mob:getPool() == 3326) then
        -- Raskovnik doesn't use this for the 1st half of its HP.
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = tpz.effect.CHARM_I	
	
	if (not target:isPC()) then
		skill:setMsg(tpz.msg.basic.SKILL_MISS)
		return typeEffect
	end
	
		local msg = MobStatusEffectMove(mob, target, typeEffect, power, 3, 30)
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

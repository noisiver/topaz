---------------------------------------------
-- Nocturnal Servitude 
-- Description: Conal gaze charm.
-- Notes: Medium charge up time.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local result = 1
    local mobhp = mob:getHPP()
	if mob:getPool() == 3069 then -- Oupire
		return 1
	end
    if (mobhp <= 25) then
        result = 0
    end

    return result
end

function onMobWeaponSkill(target, mob, skill)

	local message = tpz.msg.basic.SKILL_MISS
	local typeEffect = tpz.effect.CHARM_I
	local power = 0

	if (not target:isPC()) then
		skill:setMsg(tpz.msg.basic.SKILL_MISS)
		return typeEffect
	end

		local msg = MobStatusEffectMove(mob, target, typeEffect, 0, 3, 30)
		if target:hasStatusEffect(tpz.effect.FEALTY) then
			skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
		else
			if (msg == tpz.msg.basic.SKILL_ENFEEB_IS) then
			mob:charm(target)
			target:costume(257) --Red Bat
		end
			 skill:setMsg(tpz.msg.basic.SKILL_MISS)
		end

    return typeEffect
end

---------------------------------------------
-- Frog Song
--
-- Description: Single target charm.
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
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 2914) then -- Novv the Whitehearted
		MobStatusEffectMove(mob, target, tpz.effect.DEX_DOWN, 30, 0, 60)
		MobStatusEffectMove(mob, target, tpz.effect.VIT_DOWN, 30, 0, 60)
		MobStatusEffectMove(mob, target, tpz.effect.AGI_DOWN, 30, 0, 60)
		MobStatusEffectMove(mob, target, tpz.effect.INT_DOWN, 30, 0, 60)
		MobStatusEffectMove(mob, target, tpz.effect.MND_DOWN, 30, 0, 60)
		MobStatusEffectMove(mob, target, tpz.effect.CHR_DOWN, 30, 0, 60)
	local typeEffect = tpz.effect.STR_DOWN
		skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30, 3, 60))
	else
		local message = tpz.msg.basic.SKILL_MISS
		local typeEffect = tpz.effect.CHARM_I
		local power = 0

		if (not target:isPC()) then
			skill:setMsg(tpz.msg.basic.SKILL_MISS)
			return typeEffect
		end

		local msg = MobStatusEffectMove(mob, target, typeEffect, power, 3, 150)
		if target:hasStatusEffect(tpz.effect.FEALTY) then
			skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
		else
			if (msg == tpz.msg.basic.SKILL_ENFEEB_IS) then
			mob:charm(target)
		end
			 skill:setMsg(msg)
		end
	end

    return typeEffect
end

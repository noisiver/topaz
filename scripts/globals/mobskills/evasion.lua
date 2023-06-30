---------------------------------------------
-- Evasion
--
-- Description: Increases evasion
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: 25% Evasion Boost.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.EVASION_BOOST) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.EVASION_BOOST
    local power = (mob:getEVA() * 0.5)
    local duration = 180

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))
    return typeEffect
end

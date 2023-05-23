---------------------------------------------
-- Rhino Guard
--
-- Description: Enhances evasion.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: +25% EVA
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
    local power = (mob:getEVA() * 0.25)

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 180))
    return typeEffect
end

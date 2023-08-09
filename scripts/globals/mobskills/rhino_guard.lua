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
require("scripts/globals/pets")
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
    local tick = 0
    local duration = 180

    skill:setMsg(MobBuffMove(mob, typeEffect, power, tick, duration))
    tpz.pet.handleJugBuffs(target, mob, skill, typeEffect, power, tick, duration)

    return typeEffect
end

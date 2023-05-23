---------------------------------------------
-- Feather Barrier
--
-- Description: Enhances evasion.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
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
    local power = 25
    is mob:isNM() then
        power = 50
    end

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 180))
    return typeEffect
end

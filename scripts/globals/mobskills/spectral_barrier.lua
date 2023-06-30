---------------------------------------------
-- Spectral Barrier
--
-- Description: Magic shield
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.MAGIC_SHIELD

    skill:setMsg(MobBuffMove(mob, typeEffect, 1, 0, 30))
    return typeEffect
end

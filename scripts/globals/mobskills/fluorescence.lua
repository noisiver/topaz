---------------------------------------------
-- Fluorescence
-- Boost Ability.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.BOOST) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BOOST
    skill:setMsg(MobBuffMove(mob, typeEffect, 200, 0, 300))
    return typeEffect
end

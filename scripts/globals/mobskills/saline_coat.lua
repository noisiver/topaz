---------------------------------------------
-- Saline Coat
--
-- Family: Xzomit
-- Type: Enhancing
-- Can be dispelled: Yes
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: ~50% Magic DEF boost.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.MAGIC_DEF_BOOST) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.MAGIC_DEF_BOOST
    skill:setMsg(MobBuffMove(mob, typeEffect, 100, 0, 300))

    return typeEffect
end

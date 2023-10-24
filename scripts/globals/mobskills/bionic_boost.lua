---------------------------------------------
-- Bionic Boost
-- Bugbear
-- Gain +Counter rate
-- Certain NMs may have a higher power version of the tpz.effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/zone")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.COUNTER_BOOST) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 50
    local duration = 300
    local typeEffect = tpz.effect.COUNTER_BOOST
    local typeEffectTwo = tpz.effect.ATTACK_BOOST

    skill:setMsg(MobBuffMove(mob, typeEffect, 50, 0, 60))
    MobBuffMove(mob, typeEffectTwo, 15, 0, 60)

    return typeEffect
end

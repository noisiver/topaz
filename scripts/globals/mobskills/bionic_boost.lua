---------------------------------------------
-- Bionic Boost
-- Bugbear
-- Gain counterstance
-- Certain NMs may have a higher power version of the tpz.effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/zone")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.COUNTERSTANCE) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 50
    local duration = 300
    local typeEffect = tpz.effect.COUNTERSTANCE
    local typeEffectTwo = tpz.effect.ATTACK_BOOST

    skill:setMsg(MobBuffMove(mob, typeEffect, 50, 0, 60))
    MobBuffMove(mob, typeEffectTwo, 15, 0, 60)

    return typeEffect
end

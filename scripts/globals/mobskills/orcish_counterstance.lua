---------------------------------------------
-- Orcish Counterstance
-- Used only by Orcs in Wings of the Goddess Areas.
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
    local duration = 30
    local typeEffect = tpz.effect.COUNTER_BOOST

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 30))

    return typeEffect
end

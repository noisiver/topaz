---------------------------------------------
-- Scutum (Nightmare)
-- Enhances defense.
-- Cannot be dispelled.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.DEFENSE_BOOST) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_BOOST
    skill:setMsg(MobBuffMove(mob, typeEffect, 100, 0, 180))
    local effect = mob:getStatusEffect(typeEffect)
    effect:unsetFlag(tpz.effectFlag.DISPELABLE)

    return typeEffect
end

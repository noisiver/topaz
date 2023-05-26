---------------------------------------------
-- Barrier Tusk
-- Enhances defense and magic defense (40% DT)
-- Marids will only use Barrier Tusk if at least one of their tusks remain unbroken
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.DEFENSE_BOOST) then
		return 1
	end
	
    if mob:AnimationSub() == 0 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_BOOST
    skill:setMsg(MobBuffMove(mob, typeEffect, 50, 0, 120))
    mob:getStatusEffect(typeEffect):unsetFlag(tpz.effectFlag.DISPELABLE)
    return typeEffect
end

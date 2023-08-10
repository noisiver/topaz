---------------------------------------------
-- Healing Stomp
--
-- Description: Stomps the ground to apply regeneration.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Only used by notorious monsters.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.REGEN) then
		return 1
	end
	
    if (mob:isNM()) then
        return 0
    end
    return 1
end


function onMobWeaponSkill(target, mob, skill)
    local power = 25
    local duration = 300

    local typeEffect = tpz.effect.REGEN
	skill:setMsg(MobBuffMove(target, typeEffect, power, 3, duration))
	local effect = mob:getStatusEffect(typeEffect)
	effect:unsetFlag(tpz.effectFlag.DISPELABLE)

    return typeEffect
end

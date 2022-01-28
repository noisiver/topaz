---------------------------------------------
-- Granite Hide
--
-- Description: Immunity to physical attacks in front.
-- Type: Enhancing
--
-- Range: Self
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = tpz.effect.PHYSICAL_SHIELD
    MobBuffMove(mob, typeEffectOne, 3, 0, 120) -- Frontal PDT
    local effect1 = mob:getStatusEffect(typeEffectOne)
    effect1:unsetFlag(tpz.effectFlag.DISPELABLE)

    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT) -- lasted 15 mins

    return tpz.effect.PHYSICAL_SHIELD
end


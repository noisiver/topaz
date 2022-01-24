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
	if mob:hasStatusEffect(tpz.effect.FRONTAL_PDT) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = tpz.effect.FRONTAL_PDT
    skill:setMsg(MobBuffMove(mob, typeEffectOne, 1, 0, 60))
    local effect1 = mob:getStatusEffect(typeEffectOne)
    effect1:unsetFlag(tpz.effectFlag.DISPELABLE)

    return typeEffectOne
end


---------------------------------------------
--  Whistle (Nightmare)
--
--  Description: Increases evasion.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
-- +50% Evasion
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.EVASION_BOOST) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = (mob:getEVA() * 0.5)
    local duration = 300

    local typeEffect = tpz.effect.EVASION_BOOST

    skill:setMsg(MobBuffMove(target, typeEffect, power, 0, duration))
    local effect = mob:getStatusEffect(typeEffect)
    effect:unsetFlag(tpz.effectFlag.DISPELABLE)

    return typeEffect
end

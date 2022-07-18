---------------------------------------------
--  Whistle
--
--  Description: Increases agility.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: When used by the Nightmare Dhalmel in Dynamis - Buburimu, it grants an Evasion Boost instead.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.AGI_BOOST) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = target:getMainLvl()/5 * 3.75 + 5
    local duration = 300

    local typeEffect = tpz.effect.AGI_BOOST

    skill:setMsg(MobBuffMove(target, typeEffect, power, 0, duration))

    return typeEffect
end

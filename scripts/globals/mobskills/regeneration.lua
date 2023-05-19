---------------------------------------------
-- Regeneration
--
-- Description: Adds a Regen tpz.effect.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.REGEN) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    --floor((level-3)/2) per tick
    local power = math.floor((mob:getMainLvl() - 3) / 2)
    local duration = 90 -- buffed from 60

    local typeEffect = tpz.effect.REGEN

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 3, duration))
    return typeEffect
end

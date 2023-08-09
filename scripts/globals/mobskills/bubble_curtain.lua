---------------------------------------------
-- Bubble Curtain
--
-- Description: Reduces magical damage received by 50%
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes:Nightmare Crabs use an enhanced version that applies a Magic Defense Boost that cannot be dispelled.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.SHELL) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SHELL
    local power = 50
    local tick = 0
    local duration = 180

	if (mob:getPool() == 2612) then -- Megapod Megalops(Blade: Ku WSNM)
		power = 100
	end

    skill:setMsg(MobBuffMove(mob, typeEffect, power, tick, duration))
    tpz.pet.handleJugBuffs(target, mob, skill, typeEffect, power, tick, duration)

    return typeEffect
end

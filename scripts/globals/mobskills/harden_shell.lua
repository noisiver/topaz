---------------------------------------------
-- Harden Shell
--
-- Description: Enhances defense.
-- Type: Magical (Earth)
--
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.DEFENSE_BOOST) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_BOOST
    local power = 33
    local tick = 0
    local duration = 60
    if mob:isNM() then
        power = 80
    end

    skill:setMsg(MobBuffMove(mob, typeEffect, power, tick, duration))
    tpz.pet.handleJugBuffs(target, mob, skill, typeEffect, power, tick, duration)

    return typeEffect
end

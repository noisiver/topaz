---------------------------------------------
-- Photosynthesis
--
-- Description: Adds a Regen tpz.effect.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Only available during daytime.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.REGEN) then
		return 1
	end
    -- only used during daytime
    local currentTime = VanadielHour()
    if (currentTime >= 6 and currentTime <= 18) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local power = math.floor(mob:getMainLvl()/10)
    local duration = 90

    local typeEffect = tpz.effect.REGEN
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))
    return typeEffect
end

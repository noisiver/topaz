---------------------------------------------
-- Flame Armor
--
-- Description: Covers the user in fiery spikes. Enemies that hit it take fire damage.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.BLAZE_SPIKES) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 50
    local duration = 300
    local typeEffect = tpz.effect.BLAZE_SPIKES

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))

    return typeEffect
end

---------------------------------------------
-- Animating Wail
-- Family: Qutrub
-- Description: Let's out a wail that applies Haste to itself and nearby allies.
-- Type: Enhancing
-- Can be dispelled: Yes
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.HASTE) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 3000
    local duration = 120
    local typeEffect = tpz.effect.HASTE

    skill:setMsg(MobBuffMove(target, typeEffect, power, 0, duration))
    return typeEffect
end

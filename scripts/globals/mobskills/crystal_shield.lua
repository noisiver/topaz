---------------------------------------------
-- Crystal Shield
-- Protect II
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.PROTECT) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 20
    local duration = 300

    local typeEffect = tpz.effect.PROTECT

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))

    return typeEffect
end

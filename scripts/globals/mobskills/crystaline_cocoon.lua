---------------------------------------------
-- Crystaline Cocoon
-- Family: Aern
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
	if mob:hasStatusEffect(tpz.effect.SHELL) and mob:hasStatusEffect(tpz.effect.PROTECT) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.PROTECT
    local typeEffect2 = tpz.effect.SHELL
    local power1 = 50
    local power2 = 8
    local duration = 120

    skill:setMsg(MobBuffMove(mob, typeEffect2, power2, 0, duration))
    MobBuffMove(mob, typeEffect1, power1, 0, duration)

    return typeEffect2
end

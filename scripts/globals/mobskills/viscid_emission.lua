---------------------------------------------
-- Viscid Emission
--
-- Description: Inflicts amnesia in a frontal cone.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.AMNESIA

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60)
	
    return typeEffect
end

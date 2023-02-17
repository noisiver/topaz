---------------------------------------------
-- Bane
--
-- Description: Inflicts a zombie on all targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: 15' radial
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = tpz.effect.CURSE_II
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 20))

    return typeEffect
end

---------------------------------------------
-- Blaster
--
-- Description: Paralyzes enemy.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows.
-- Range: Melee?
-- Notes: Very potent paralysis effect. Is NOT a Gaze Attack, unlike Chaotic Eye.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.PARALYSIS


    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 70, 0, 300))

    return typeEffect
end

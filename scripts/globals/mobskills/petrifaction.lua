---------------------------------------------
-- Petrifaction
-- Description: Petrifies opponent with a gaze attack
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Single gaze
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if target:hasStatusEffect(tpz.effect.GRADUAL_PETRIFICAITON) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.PETRIFICATION
    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 300))
    return typeEffect
end

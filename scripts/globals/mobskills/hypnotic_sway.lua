---------------------------------------------
-- Hypnotic Sway
-- Description: Inflicts amnesia conal(Gaze)
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local message = tpz.msg.basic.SKILL_MISS
    local typeEffect = tpz.effect.AMNESIA
    local power = 1
    local duration = 300

    skill:setMsg(MobGazeMove(mob, target, typeEffect, power, 0, duration))
    return typeEffect
end

---------------------------------------------
-- Yawn
-- 15' AoE sleep
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local message = tpz.msg.basic.SKILL_MISS
    local typeEffect = tpz.effect.LULLABY

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 120))

    return typeEffect
end

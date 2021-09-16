---------------------------------------------
-- Hypnic Lamp
-- 	Inflicts Sleep upon targets facing the user. Ignores shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:AnimationSub() == 1 then
        return 1
    else
        return 0
    end
end

function onMobWeaponSkill(target, mob, skill)
    local message = tpz.msg.basic.SKILL_MISS
    local typeEffect = tpz.effect.LULLABY

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 120))

    return typeEffect
end

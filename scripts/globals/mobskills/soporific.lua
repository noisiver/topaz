---------------------------------------------
-- Dream Flower
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
    local typeEffect = tpz.effect.SLEEP_II

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 90))

    return tpz.effect.SLEEP_I
end

---------------------------------------------
-- Tepal Twist
--  -50% Max HP Down
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.MAX_HP_DOWN
    local power = 50

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 300))

    return typeEffect
end

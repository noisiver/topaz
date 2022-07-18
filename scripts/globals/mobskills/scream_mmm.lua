---------------------------------------------
-- Scream (MMM - Artemisia)
-- 15' Terror.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.TERROR
    local duration = 12

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, duration))

    return typeEffect
end

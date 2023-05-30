---------------------------------------------
-- Occultation
--
-- Description: Creates 25 shadows
-- Type: Magical (Wind)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local shadows = 10
    local typeEffect = tpz.effect.BLINK

    skill:setMsg(MobBuffMove(mob, typeEffect, base, 0, 300))
    mob:addStatusEffectEx(tpz.effect.COPY_IMAGE, tpz.effect.COPY_IMAGE_3, 1, 0, 300, 0, shadows)
    return typeEffect
end

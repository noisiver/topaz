---------------------------------------------
-- Chilling Roar
-- Causes Terror, which causes the victim to be stunned for the duration of the effect, this can not be removed.
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
    local duration = 15

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, duration))
    mob:lowerEnmity(target, 70)

    return typeEffect
end

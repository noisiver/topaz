---------------------------------------------
-- Intimidate
-- Inflicts slow on targets in a fan-shaped area of effect.
-- Removes haste, very potent
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SLOW
    local power = 5000
    local duration = 10
    local params = {}
    params.overwriteHaste = true

    skill:setMsg(MobStatusEffectMoveSub(mob, target, typeEffect, power, 0, duration, 0, 0, 0, params))

    return typeEffect
end

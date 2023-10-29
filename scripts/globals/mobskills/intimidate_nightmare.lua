---------------------------------------------
-- Intimidate
-- Inflicts slow on targets in a fan-shaped area of effect.
-- Removes haste, very potent slow(100%)
-- Resets hate
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
    local power = 10000
    local duration = 10
    local params = {}
    target:delStatusEffectSilent(tpz.effect.HASTE)

    skill:setMsg(MobStatusEffectMoveSub(mob, target, typeEffect, power, 0, duration, 0, 0, 0, params))
    mob:resetEnmity(target)

    return typeEffect
end

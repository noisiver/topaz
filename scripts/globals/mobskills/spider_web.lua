---------------------------------------------
-- Spider Web
-- Entangles all targets in an area of effect.
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
    local params = {}
    target:delStatusEffectSilent(tpz.effect.HASTE)

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 300, params))

    return typeEffect
end

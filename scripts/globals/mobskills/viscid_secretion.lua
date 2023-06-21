---------------------------------------------
-- Viscid Secretion
-- Conal Slow and Gravity.
-- Resets hate.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local params = {}
    params.overwriteSlow = true

    MobStatusEffectMove(mob, target, tpz.effect.WEIGHT, 50, 0, 300)
    skill:setMsg(MobStatusEffectMove(mob, target, tpz.effect.SLOW, 5000, 0, 300, params)) 
    mob:resetEnmity(target)

    return typeEffect
end

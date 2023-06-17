---------------------------------------------
-- Intimidate
-- Inflicts slow on targets in a fan-shaped area of effect.
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

    if not target:hasStatusEffect(tpz.effect.HASTE) then
        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 2550, 0, 300))
    else
        return skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    end
    return typeEffect
end

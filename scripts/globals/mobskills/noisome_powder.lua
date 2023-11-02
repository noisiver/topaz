---------------------------------------------
-- Noisome Powder
-- Reduces attack of targets in area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getPool() == 9076) then -- Coccinellidae MMM
        return 0
    end
    if VanadielHour() >= 6 and VanadielHour() <= 18 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.ATTACK_DOWN
    if not target:hasStatusEffect(tpz.effect.ATTACK_DOWN) then
        skill:setMsg(MobStatusEffectMoveSub(mob, target, typeEffect, 40, 0, 30, 0, 0, 0))
    else
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    end
    return typeEffect
end

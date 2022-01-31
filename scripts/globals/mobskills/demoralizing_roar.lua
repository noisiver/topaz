---------------------------------------------
-- Demoralizing Roar
--
-- Description: Weakens attack of enemies within range.
-- Type: Magical (Water)
-- 50% 
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.ATTACK_DOWN
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 300))
    return typeEffect
end

---------------------------------------------
--  Wild Oats
--
--  Description: Additional effect: Vitality Down. Duration of effect varies on TP.
--  Type: Physical (Piercing)
--
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.VIT_DOWN
    local power = math.random(1, 10)    -- added

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 3, 120))   -- changed from 10 to power

    return typeEffect
end

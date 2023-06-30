---------------------------------------------
-- Rumble
--
-- Description: A disorienting vibration lowers evasion of targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown radial
-- Notes: -10% Evasion
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.EVASION_DOWN
    local power = math.floor(target:getEVA()* 0.1)
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 300))

    return typeEffect
end

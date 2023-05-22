---------------------------------------------
-- Ink Cloud
--
-- Description: Blinds nearby targets with ink.
-- Also increases Evasion.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown radial
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BLINDNESS
    local power = (mob:getEVA() * 0.5)

    MobBuffMove(mob, tpz.effect.EVASION_BOOST, power, 0, 300)
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 55, 0, 300))

    return typeEffect
end

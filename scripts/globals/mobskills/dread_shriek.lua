---------------------------------------------
-- Dread Shriek
--
-- Description: An unsettling shriek paralyzes targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 10' radial
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
    local typeEffect = tpz.effect.PARALYSIS
    local power = 50
    if mob:isNM() then
        power = 75
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 300))

    return typeEffect
end

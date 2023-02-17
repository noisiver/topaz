---------------------------------------------
-- Noxious Spray
--
-- Description: Poisons targets in range. Used by vials. 20/tick poison.
-- Area of Effect (10.0')
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.POISON

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 20, 3, 300))

    return typeEffect
end

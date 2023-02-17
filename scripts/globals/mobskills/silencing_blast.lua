---------------------------------------------
-- Silencing Blast
--
-- Description: Silences targets in range. Used by vial/grenades.
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
    local typeEffect = tpz.effect.SILENCE

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 300))
    DespawnMob(mob:getID())

    return typeEffect
end

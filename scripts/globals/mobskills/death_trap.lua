---------------------------------------------
-- Death Trap
--
-- Description: Attempts to stun or poison any players in a large trap. Resets hate.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 30' radial
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
    local typeEffect = tpz.effect.POISON
    local typeEffectTwo = tpz.effect.STUN


    MobStatusEffectMove(mob, target, typeEffectTwo, 1, 0, 8)
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 20, 0, 90))

    if (MobPhysicalHit(mob, skill)) then
        mob:resetEnmity(target)
    end
    return typeEffect
end

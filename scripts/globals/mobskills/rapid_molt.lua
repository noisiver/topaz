---------------------------------------------
-- Rapid Molt
-- Family: Hpemde
-- Description: Erases all negative effects on the mob, and adds a Regen tpz.effect.
-- Can be dispelled: Yes (regen)
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Hpemde will generally not attempt to use this ability if no erasable effects exist on them.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if utils.hasDispellableEffect(target) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.REGEN

    MobBuffMove(mob, typeEffect, 40, 3, 30)
    return MobSelfDispelMove(mob, skill)
end

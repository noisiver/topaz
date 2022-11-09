---------------------------------------------
-- Debilitating Drone
-- (NMs Only)
-- Drains all targets attributes for the duration.
-- AOE 15'
-- Ignores shadows.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:isNM() then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    return DrainMultipleAttributesPhysical(mob, target, skill, 21, 60, 7, 300)
end

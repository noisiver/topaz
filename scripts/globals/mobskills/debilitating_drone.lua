---------------------------------------------
-- Debilitating Drone
-- Used by Tsetse Flies and NM's'
-- Drains all targets attributes for the duration.
-- AOE 15'
-- Ignores shadows.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local msg, effectsLanded = DrainMultipleAttributesPhysical(mob, target, skill, 10, 60, 7, 300)

    skill:setMsg(msg)

    return effectsLanded
end

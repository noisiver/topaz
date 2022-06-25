---------------------------------------------
-- Debilitating Drone
-- (NMs Only) AoE Inflicts a random attribute reduction.
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

    skill:setMsg(DrainMultipleAttributes(mob, target, 10, 60, 1, 300))

    return 1
end

---------------------------------------------
-- Ultimate Terror
--
-- Description: AoE Absorb All with randomness
-- Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local msg, effectsLanded = DrainMultipleAttributesPhysical(mob, target, skill, 21, 60, math.random(1, 7), 300)

    skill:setMsg(msg)

    return effectsLanded
end
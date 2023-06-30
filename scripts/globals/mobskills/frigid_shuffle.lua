---------------------------------------------
-- Frigid Shuffle
--
-- Description: An icy waltz paralyzes targets in an area of effect.
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
    local message = tpz.msg.basic.SKILL_MISS
    local typeEffect = tpz.effect.PARALYSIS

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 75, 0, 300))

    return typeEffect

end

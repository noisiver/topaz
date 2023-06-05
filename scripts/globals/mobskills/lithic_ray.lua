---------------------------------------------
-- Hex Eye
--
-- Description: Petrify + Dia + Hate Reset.
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Line of sight
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local message = tpz.msg.basic.SKILL_MISS
    local typeEffect = tpz.effect.PETRIFICATION

    if (target:isFacing(mob)) and not target:hasStatusEffect(tpz.effect.BLINDNESS) then
        MobStatusEffectMoveSub(mob, target, tpz.effect.DIA, 2, 3, 30, 0, 24, 2)
        mob:resetEnmity(target)
    end
    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 300))


    return typeEffect
end

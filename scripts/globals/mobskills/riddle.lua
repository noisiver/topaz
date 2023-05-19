---------------------------------------------
-- Riddle
--
-- Description: Reduces maximum MP in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 15' radial
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.MAX_MP_DOWN
    local playerINT = target:getStat(tpz.mod.INT)
    local power = 40 + (playerINT/ 2)

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 300))

    return typeEffect
end

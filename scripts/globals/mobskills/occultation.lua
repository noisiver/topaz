---------------------------------------------
-- Occultation
--
-- Description: Creates 25 shadows
-- Type: Magical (Wind)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local shadows = 10
    local typeEffect = tpz.effect.BLINK
    local procChance = 100

    skill:setMsg(MobBuffMoveSub(mob, typeEffect, shadows, 0, 300, 0, procChance, 0))
    return typeEffect
end

---------------------------------------------
--  Wild Carrot - ENM
--  Only used by Bearclaw Leveret(Follow The White Rabbit - ENM)
--  Description: Creates shadow images that each absorb a single attack directed at you.
--  Type: Magical (Wind)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local base = 12
    local typeEffect = tpz.effect.BLINK
    skill:setMsg(MobBuffMove(mob, typeEffect, base, 0, 300))
    return typeEffect
end

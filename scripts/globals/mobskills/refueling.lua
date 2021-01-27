---------------------------------------------
-- Refueling
-- Increases attack speed.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.HASTE
    skill:setMsg(MobBuffMove(mob, typeEffect, 2500, 0, 300)) -- buffed from 1000
    return typeEffect
end

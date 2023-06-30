---------------------------------------------
-- Overdrive
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.OVERDRIVE

    MobBuffMove(mob, typeEffect, 1, 0, 60)

    skill:setMsg(tpz.msg.basic.USES)

    return typeEffect
end

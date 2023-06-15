---------------------------------------------
-- Berserk JA
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BERSERK
    skill:setMsg(MobBuffMoveSub(mob, typeEffect, 25, 0, 60, 0, 25, 0))
    return typeEffect
end

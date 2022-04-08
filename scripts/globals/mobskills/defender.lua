---------------------------------------------
-- Defender JA
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENDER
    skill:setMsg(MobBuffMove(mob, typeEffect, 0, 0, 300))
    return typeEffect
end

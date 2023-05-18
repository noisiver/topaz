---------------------------------------------
-- Demonic Howl
-- 10' AoE +50%. Slow (weaker than Haste)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SLOW

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 5000, 0, 300))

    return typeEffect
end

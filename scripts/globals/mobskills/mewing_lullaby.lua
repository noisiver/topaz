---------------------------------------------------
-- Mewing Lullaby
-- aoe light based sleep and lowers mob TP to zero
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.LULLABY

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60))
    target:setTP(0)

    return tpz.effect.SLEEP_I
end

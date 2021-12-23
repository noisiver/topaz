---------------------------------------------------
-- BrainJack
--
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BURN
    local power = 15

    MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)
    MobCharmMove(mob, target, skill, 0, 60)

    return tpz.effect.CHARM_I
end

---------------------------------------------
-- Spring Breeze
--
-- Description: AoE TP-Reduction and Sleep tpz.effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    skill:setMsg(MobStatusEffectMove(mob, target, tpz.effect.SLEEP_I, 1, 0, 120))
    target:setTP(target:getTP() * 0.5)

    return tpz.effect.SLEEP_I
end

---------------------------------------------
-- Stinking Gas
--
-- Description: Lowers Vitality of enemies within range.
-- Type: Magical (Wind)
--
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.VIT_DOWN
    local tick = 30
    local power = (target:getStat(tpz.mod.VIT) * 0.2) +5

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, tick, 300))

    return typeEffect
end

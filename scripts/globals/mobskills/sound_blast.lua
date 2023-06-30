---------------------------------------------
-- Sound Blast
-- 15' Reduces INT of players in area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.INT_DOWN
    local tick = 30
    local power = (target:getStat(tpz.mod.INT) * 0.2) +5

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, tick, 300))

    return typeEffect
end

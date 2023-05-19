---------------------------------------------
-- Scream
-- 15' Reduces MND of players in area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.MND_DOWN
    local tick = 60
    local power = (target:getStat(tpz.mod.MND) * 0.25)

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, tick, 300))

    return typeEffect
end

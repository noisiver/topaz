---------------------------------------------
-- Awful Eye (Nightmare)
-- 10' Petrifies players and reduces STR of players in area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.PETRIFICATION
    local tick = 0
    local power = 1
    local typeEffectTwo = tpz.effect.STR_DOWN
    local tickTwo = 60
    local powerTwo = (target:getStat(tpz.mod.STR) * 0.2) +5

    MobGazeMove(mob, target, typeEffectTwo, powerTwo, tickTwo, 300)
    skill:setMsg(MobGazeMove(mob, target, typeEffect, power, tick, 45))
    if (target:isFacing(mob)) then
        mob:resetEnmity(target)
    end

    return typeEffect
end

---------------------------------------------
-- Mind Drain
-- Steals mnd from target
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 128) then -- Ancient Vessel
        local typeEffectTwo = tpz.effect.STR_DOWN
        local typeEffectThree = tpz.effect.DEX_DOWN
        local typeEffectFour = tpz.effect.VIT_DOWN
        local typeEffectFive = tpz.effect.AGI_DOWN
        local typeEffectSix = tpz.effect.MND_DOWN
        local typeEffectSeven = tpz.effect.INT_DOWN
        local typeEffectEight = tpz.effect.CHR_DOWN
        MobStatusEffectMove(mob, target, typeEffectTwo, 10, 3, 120)
        MobStatusEffectMove(mob, target, typeEffectThree, 10, 3, 120)
        MobStatusEffectMove(mob, target, typeEffectFour, 10, 3, 120)
        MobStatusEffectMove(mob, target, typeEffectFive, 10, 3, 120)
        MobStatusEffectMove(mob, target, typeEffectSix, 10, 3, 120)
        MobStatusEffectMove(mob, target, typeEffectSeven, 10, 3, 120)
        MobStatusEffectMove(mob, target, typeEffectEight, 10, 3, 120)
    end

    local typeEffect = tpz.effect.MND_DOWN
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120))
    return typeEffect
end

---------------------------------------------
-- Frog Song
--
-- Description: Lowers all stats of targets in a 15 yalm radius.
-- Type: Enhancing
-- Utsusemi/Blink absorb: Ignore
-- Range: Melee
-- Notes: 
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobStatusEffectMove(mob, target, tpz.effect.DEX_DOWN, 30, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.VIT_DOWN, 30, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.AGI_DOWN, 30, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.INT_DOWN, 30, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.MND_DOWN, 30, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.CHR_DOWN, 30, 0, 60)
    local typeEffect = tpz.effect.STR_DOWN
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30, 3, 60))


    return typeEffect
end

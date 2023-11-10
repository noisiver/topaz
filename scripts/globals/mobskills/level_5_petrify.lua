---------------------------------------------
-- Level 5 Petrify
--
-- Description: AOE Petrify and on multiples of 5.
-- Type: Physical
-- Utsusemi/Blink absorb: Ignore
-- Range: 15' radial
-- Notes: If used by All-seeing Onyx Eye, enmity is reset.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local allSeeingOnyxEye = mob:getPool() == 88
    local typeEffect = tpz.effect.PETRIFICATION
    if (target:getMainLvl()%5 == 0) then
        skill:setMsg(MobStatusEffectMoveSub(mob, target, typeEffect, 1, 0, 30, 0, 0, 0))
    else
        skill:setMsg(tpz.msg.basic.SKILL_MISS) -- no effect
    end

    if allSeeingOnyxEye then
	    mob:resetEnmity(target)
    end

    return typeEffect
end

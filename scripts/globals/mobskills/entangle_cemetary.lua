---------------------------------------------
-- Entangle
--
-- Description: Attempts to bind a single target with vines.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee
-- Notes: When used by the Cemetery Cherry and Jidra, it also deals damage, inflicts Poison, and resets hate. When used by Cernunnos, also drains HP equal to the damage inflicted.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.POISON
    local typeEffectTwo = tpz.effect.BIND

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    MobStatusEffectMove(mob, target, typeEffect, 50, 3, 60)
    MobStatusEffectMove(mob, target, typeEffectTwo, 1, 0, 300)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then target:tryInterruptSpell(mob, info.hitslanded) end
    if (MobPhysicalHit(skill)) then
        mob:resetEnmity(target)
    end
    return dmg
end

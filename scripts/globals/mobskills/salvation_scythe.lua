---------------------------------------------
--  Salvation Scythe
--
--  Description: Deals physical damage in a 15' radius AOE. Additional Effect: Poison, Paralyze, Slow, Bio.
--  Type:  Magical
--
--
--  Utsusemi/Blink absorb: Ignores Shadows
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobPhysicalStatusEffectMove(mob, target, tpz.effect.POISON, 10, 3, 30)
    MobPhysicalStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 15, 1, 30)
    MobPhysicalStatusEffectMove(mob, target, tpz.effect.SLOW, 1250, 1, 30)
    MobPhysicalStatusEffectMove(mob, target, tpz.effect.BIO, 20, 3, 30)

    local numhits = 1
    local accmod = 1
    local dmgmod = 3
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_2_SHADOW)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end

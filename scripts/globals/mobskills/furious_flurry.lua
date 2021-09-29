---------------------------------------------------
-- Furious Flurry
-- Deals damage to a single target with 3 hits. Additional effect: Weight and Silence
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 3
    local accmod = 1
    local dmgmod = 1
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.H2H, info.hitslanded)

    local typeeffectOne = tpz.effect.WEIGHT
    local typeeffectTwo = tpz.effect.SILENCE

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.H2H)
    MobPhysicalStatusEffectMove(mob, target, skill, typeeffectOne, 50, 0, 60)
    MobPhysicalStatusEffectMove(mob, target, skill, typeeffectTwo, 1, 0, 60)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end

    return dmg
end

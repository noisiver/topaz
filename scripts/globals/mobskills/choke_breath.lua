---------------------------------------------------
-- Choke Breath
-- Damages enemies in a fan-shaped area of effect. Additional effect: Paralysis & Silence
-- Type: Physical
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: 3 shadows
-- Range: Melee
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local params_phys = {}
    params.multiplier = dmgmod
    params.tp150 = 1
    params.tp300 = 1
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, params_phys)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.WIND, info.hitslanded*math.random(2, 3))
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.WIND)
    local typeEffect = tpz.effect.PARALYSIS
    local typeEffectTwo = tpz.effect.SILENCE
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 25, 0, 300)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffectTwo, 1, 0, 300)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end

---------------------------------------------------
-- Terror Touch
-- Additional effect: Weakens attacks. Accuracy varies with TP.
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
    local typeEffect = tpz.effect.ATTACK_DOWN
    if (mob:getPool() == 9004) then -- The Big One
        dmgmod = 2.0
        local typeEffectTwo = tpz.effect.ACCURACY_DOWN
        MobPhysicalStatusEffectMove(mob, target, skill, typeEffectTwo, 100, 0, 30)
        local typeEffectFour = tpz.effect.STR_DOWN
        MobPhysicalStatusEffectMove(mob, target, skill, typeEffectFour, 20, 0, 30)
        local typeEffectFive = tpz.effect.DEX_DOWN
        MobPhysicalStatusEffectMove(mob, target, skill, typeEffectFive, 20, 0, 30)
        target:setTP(0)
    end
    local params_phys = {}
    params_phys.multiplier = dmgmod
    params_phys.tp150 = 1
    params_phys.tp300 = 1
    params_phys.str_wsc = 0.0
    params_phys.dex_wsc = 0.2
    params_phys.vit_wsc = 0.0
    params_phys.agi_wsc = 0.0
    params_phys.int_wsc = 0.2
    params_phys.mnd_wsc = 0.0
    params_phys.chr_wsc = 0.0
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_CRIT_VARIES, params_phys)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
    MobPhysicalStatusEffectMoveSub(mob, target, skill, typeEffect, 70, 0, 45, 0, 0, 0)
    if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end

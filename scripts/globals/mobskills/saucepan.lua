---------------------------------------------
-- Saucepan
-- Force feeds an unsavory dish.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local params_phys = {}
    params_phys.multiplier = dmgmod
    params_phys.tp150 = 1
    params_phys.tp300 = 1
    params_phys.str_wsc = 0.0
    params_phys.dex_wsc = 0.0
    params_phys.vit_wsc = 0.0
    params_phys.agi_wsc = 0.0
    params_phys.int_wsc = 0.0
    params_phys.mnd_wsc = 0.2
    params_phys.chr_wsc = 0.2
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, params_phys)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
    if (MobPhysicalHit(mob, skill)) then
        if (target:hasStatusEffect(tpz.effect.FOOD)) then
            target:delStatusEffectSilent(tpz.effect.FOOD)
        elseif (target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD)) then
            target:delStatusEffectSilent(tpz.effect.FIELD_SUPPORT_FOOD)
        end
        target:addStatusEffectEx(tpz.effect.FIELD_SUPPORT_FOOD, tpz.effect.FOOD, 255, 0, 1800)
    end
    return dmg
end

---------------------------------------------------
-- Bonebreaking Barrage
-- Deals damage to a single target. Additional effect: Gravity, Max HP Down (-50%)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
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
    params.str_wsc = 0.3
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT,params_phys)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.BLUNT,info.hitslanded)

    MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.MAX_HP_DOWN, 0, 0, 300)
    MobStatusEffectMove(mob, target, tpz.effect.WEIGHT, 50, 0, 30)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)

    return dmg
end

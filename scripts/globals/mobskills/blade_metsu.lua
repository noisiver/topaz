---------------------------------------------
--  Blade Metsu
--
--  Description: Additional effect: Paralysis Kikoku/Yoshimitsu: Temporarily enhances Subtle Blow tpz.effect.
--  Type: Physical
--  Range: Melee
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
    params_phys.dex_wsc = 0.3
    params_phys.vit_wsc = 0.0
    params_phys.agi_wsc = 0.0
    params_phys.int_wsc = 0.0
    params_phys.mnd_wsc = 0.0
    params_phys.chr_wsc = 0.0

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, params_phys, 3, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    local duration = 300
    local typeEffect = tpz.effect.PARALYSIS
    local power = 10

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 0, duration)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    return dmg

end

---------------------------------------------------
-- Eagle Eye Shot
-- Used by Lamie No.8
-- Ignores shadows
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 4
    local dmgmod = 4.0
    local params_phys = {}
    params_phys.multiplier = dmgmod
    params_phys.tp150 = 1
    params_phys.tp300 = 1
    params_phys.str_wsc = 0.0
    params_phys.dex_wsc = 0.0
    params_phys.vit_wsc = 0.0
    params_phys.agi_wsc = 0.0
    params_phys.int_wsc = 0.0
    params_phys.mnd_wsc = 0.0
    params_phys.chr_wsc = 0.0

    local info = MobRangedMove(mob, target, skill, numhits, accmod, dmgmod, TP_ATK_VARIES, params_phys, 2, 2)

    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.NONE, MOBPARAM_IGNORE_SHADOWS)

    if dmg > 0 then
       target:addTP(20)
       mob:addTP(80)
    end

    target:takeDamage(dmg, mob, tpz.attackType.RANGED, tpz.damageType.NONE)

    return dmg
end

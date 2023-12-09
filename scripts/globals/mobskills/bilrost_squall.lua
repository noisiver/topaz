---------------------------------------------
--  Bilrost Squall
--
--  Description: Deals damage + random enfeebling effect.
--  Type:  Magical
--
--
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 20' radial
--  Notes: Only used when a cerberus's health is 25% or lower (may not be the case for Orthrus). The burn effect takes off upwards of 20 HP per tick.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BURN
    local power = 21
    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    MobStatusEffectMoveSub(mob, target, typeEffect, power, 3, 60, 0, 69, 0)
    return dmg
end

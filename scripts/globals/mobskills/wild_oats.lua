---------------------------------------------
--  Wild Oats
--
--  Description: Additional effect: Vitality Down. Duration of effect varies on TP.
--  Type: Physical (Piercing)
--
--
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
    local dmgmod = 2.0
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, MOBPARAM_2_SHADOW)

    local typeEffect = tpz.effect.VIT_DOWN
    local power = (target:getStat(tpz.mod.VIT) * 0.2) +5
    local tick = 60

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, tick, 300)
    return dmg
end